#!/usr/bin/env python3
"""Add newly supported Nixvim plugins to the npins lock file."""

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
import urllib.request
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
SOURCES = ROOT / "npins" / "sources.json"


@dataclass(frozen=True)
class Plugin:
    attribute: str
    owner: str
    repository: str


@dataclass(frozen=True)
class GitPlugin:
    attribute: str
    url: str
    branch: str


EXPLICIT_GITHUB = {
    "blink.cmp": Plugin("blink-cmp", "saghen", "blink.cmp"),
    "blink.pairs": Plugin("blink-pairs", "Saghen", "blink.pairs"),
    "codediff.nvim": Plugin("codediff-nvim", "esmuellert", "codediff.nvim"),
    "cord.nvim": Plugin("cord-nvim", "vyfor", "cord.nvim"),
    "fff.nvim": Plugin("fff-nvim", "dmtrKovalenko", "fff.nvim"),
    "grug-far.nvim": Plugin("grug-far-nvim", "MagicDuck", "grug-far.nvim"),
    "haskell-tools.nvim": Plugin(
        "haskell-tools-nvim", "mrcjkb", "haskell-tools.nvim"
    ),
    "lsp-progress.nvim": Plugin(
        "lsp-progress-nvim", "linrongbin16", "lsp-progress.nvim"
    ),
    "lzn-auto-require": Plugin(
        "lzn-auto-require", "horriblename", "lzn-auto-require"
    ),
    "mini.test": Plugin("mini-test", "nvim-mini", "mini.test"),
    "nui.nvim": Plugin("nui-nvim", "MunifTanjim", "nui.nvim"),
    "nvim-dbee": Plugin("nvim-dbee", "kndndrj", "nvim-dbee"),
    "papis.nvim": Plugin("papis-nvim", "jghauser", "papis.nvim"),
    "rustaceanvim": Plugin("rustaceanvim", "mrcjkb", "rustaceanvim"),
    "sg.nvim": Plugin("sg-nvim", "sourcegraph", "sg.nvim"),
    "teamtype": Plugin("teamtype", "teamtype", "teamtype"),
    "telescope-manix": Plugin("telescope-manix", "mrcjkb", "telescope-manix"),
    "vectorcode.nvim": Plugin("vectorcode-nvim", "Davidyz", "VectorCode"),
    "windsurf.nvim": Plugin("windsurf-nvim", "Exafunction", "windsurf.nvim"),
}

EXPLICIT_GIT = {
    "gitlab.vim": GitPlugin(
        "gitlab-vim",
        "https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git",
        "main",
    ),
    "nvim-dap-python": GitPlugin(
        "nvim-dap-python",
        "https://codeberg.org/mfussenegger/nvim-dap-python.git",
        "master",
    ),
}


def run(*args: str) -> str:
    result = subprocess.run(
        args,
        cwd=ROOT,
        check=True,
        stdout=subprocess.PIPE,
        text=True,
    )
    return result.stdout.strip()


def current_system() -> str:
    return run("nix", "eval", "--raw", "--impure", "--expr", "builtins.currentSystem")


def uncovered_pnames(system: str) -> set[str]:
    raw = run(
        "nix",
        "eval",
        "--json",
        f".#lib.uncoveredNixvimPackages.{system}",
        "--apply",
        "packages: map (package: package.pname or package.name) packages",
    )
    return set(json.loads(raw))


def generated_plugins() -> dict[str, Plugin]:
    nixpkgs = Path(run("nix", "eval", "--raw", ".#lib.nixpkgsSource"))
    generated = (
        nixpkgs
        / "pkgs"
        / "applications"
        / "editors"
        / "vim"
        / "plugins"
        / "generated.nix"
    ).read_text()

    records: dict[str, Plugin] = {}
    blocks = re.split(r"(?m)^  (?=[A-Za-z0-9_+.-]+ = )", generated)
    for block in blocks:
        attribute = re.match(r"([A-Za-z0-9_+.-]+) = ", block)
        pname = re.search(r'^    pname = "([^"]+)";', block, re.MULTILINE)
        owner = re.search(r'^      owner = "([^"]+)";', block, re.MULTILINE)
        repository = re.search(r'^      repo = "([^"]+)";', block, re.MULTILINE)
        if attribute and pname and owner and repository:
            records[pname.group(1)] = Plugin(
                attribute=attribute.group(1),
                owner=owner.group(1),
                repository=repository.group(1),
            )
    return records


def default_branch(plugin: Plugin, token: str) -> str:
    request = urllib.request.Request(
        f"https://api.github.com/repos/{plugin.owner}/{plugin.repository}",
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {token}",
            "X-GitHub-Api-Version": "2022-11-28",
        },
    )
    with urllib.request.urlopen(request, timeout=30) as response:
        return json.load(response)["default_branch"]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true", help="only report missing pins")
    parser.add_argument("--system", default=current_system())
    args = parser.parse_args()

    pnames = uncovered_pnames(args.system)
    generated = generated_plugins()
    pins = json.loads(SOURCES.read_text())["pins"]

    github_sources = generated | EXPLICIT_GITHUB
    missing = sorted(
        (github_sources[pname] for pname in pnames if pname in github_sources),
        key=lambda plugin: plugin.attribute.lower(),
    )
    missing = [plugin for plugin in missing if plugin.attribute not in pins]
    missing_git = sorted(
        (EXPLICIT_GIT[pname] for pname in pnames if pname in EXPLICIT_GIT),
        key=lambda plugin: plugin.attribute.lower(),
    )
    missing_git = [plugin for plugin in missing_git if plugin.attribute not in pins]
    unresolved = sorted(
        pname
        for pname in pnames
        if pname not in github_sources and pname not in EXPLICIT_GIT
    )

    if args.check:
        for plugin in missing:
            print(f"missing pin: {plugin.attribute}", file=sys.stderr)
        for plugin in missing_git:
            print(f"missing pin: {plugin.attribute}", file=sys.stderr)
        for pname in unresolved:
            print(f"unresolved Nixvim package: {pname}", file=sys.stderr)
        return 1 if missing or missing_git or unresolved else 0

    token = os.environ.get("GITHUB_TOKEN")
    if missing and not token:
        parser.error("GITHUB_TOKEN is required to add pins")

    for index, plugin in enumerate(missing, start=1):
        branch = default_branch(plugin, token)
        print(
            f"[{index}/{len(missing)}] {plugin.attribute} "
            f"<- {plugin.owner}/{plugin.repository}@{branch}",
            flush=True,
        )
        run(
            "npins",
            "add",
            "github",
            plugin.owner,
            plugin.repository,
            "--branch",
            branch,
            "--name",
            plugin.attribute,
        )

    for plugin in missing_git:
        print(
            f"{plugin.attribute} <- {plugin.url}@{plugin.branch}",
            flush=True,
        )
        run(
            "npins",
            "add",
            "git",
            plugin.url,
            "--forge",
            "none",
            "--branch",
            plugin.branch,
            "--name",
            plugin.attribute,
        )

    if unresolved:
        print("The following packages need explicit source mappings:", file=sys.stderr)
        for pname in unresolved:
            print(f"  {pname}", file=sys.stderr)
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
