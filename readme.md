# neovim-plugins-nightly-overlay

A source-only overlay that keeps the Neovim plugins used by Nixvim near their
upstream heads while preserving the packaging knowledge in nixpkgs.

The overlay currently tracks 595 upstream repositories. Its checks inspect
Nixvim's evaluated package options and fail when any supported Vim or Neovim
plugin is not supplied by the overlay. A small collection of useful plugins
outside Nixvim is included as well.

## Why this overlay is different

Most nightly plugin overlays create a second plugin package set. That makes
them awkward to use with Nixvim and discards dependency, patch, build, and
runtime metadata maintained by nixpkgs.

This overlay instead replaces `pkgs.vimPlugins.<name>.src` and `version` in
place. Existing nixpkgs overrides remain intact, and Nixvim automatically sees
the nightly packages through the normal `pkgs.vimPlugins` attributes.

When an explicitly tracked extra no longer exists in nixpkgs, the overlay
builds a basic Vim plugin package rather than making the entire overlay fail to
evaluate.

## Installation

```nix
{
  inputs.neovim-plugins-nightly-overlay.url =
    "github:zachcoyle/neovim-plugins-nightly-overlay";
}
```

Then, in a NixOS or nix-darwin module that receives `inputs`:

```nix
{
  nixpkgs.overlays = [
    inputs.neovim-plugins-nightly-overlay.overlays.default
  ];
}
```

For Nixvim embedded in Home Manager or nix-darwin, make sure the overlay is
applied to the same nixpkgs instance passed to the Nixvim module. No Nixvim
configuration changes are required.

## Guarantees

`nix flake check` verifies that:

- every overlay target evaluates to a derivation;
- every target carries its nightly version and source provenance;
- every Vim or Neovim package exposed by current Nixvim is covered;
- the maintained Nix files are formatted.

Each overridden package exposes its source information at:

```nix
pkgs.vimPlugins.<name>.passthru.nightlyOverlay
```

For example:

```nix
{
  sourceName = "telescope-nvim";
  revision = "<full upstream revision>";
}
```

## Updating

Enter the development shell and synchronize Nixvim coverage before refreshing
existing pins:

```console
nix develop
export GITHUB_TOKEN="$(gh auth token)"
python scripts/sync.py
npins update --max-concurrent-downloads 10
nix flake check --all-systems --no-build
nix build '.#checks.x86_64-linux'
```

`scripts/sync.py` evaluates Nixvim's real package defaults, matches ordinary
plugins against nixpkgs' generated Vim plugin registry, handles the exceptional
Lua and non-GitHub packages explicitly, and adds only genuinely missing pins.
It never determines coverage from directory names alone.

To check coverage without modifying anything:

```console
python scripts/sync.py --check
```

The read-only GitHub Actions workflow performs the same evaluation and build
checks on every pull request and push to `master`.

## Caveats

This intentionally trades some stability for much fresher plugin sources.
Upstream changes can temporarily disagree with patches or assumptions in the
pinned nixpkgs revision. The checks catch structural and coverage regressions,
but they cannot prove that every possible combination of almost six hundred
plugins starts successfully.

Use a flake lock file and update deliberately. For especially important editor
configurations, add a downstream startup check that builds and launches your
actual Nixvim package.

## Contributing

New plugins should normally be added through `scripts/sync.py` or `npins`, not
by manually editing `npins/sources.json`. Use `source-aliases.nix` only when a
single upstream source intentionally backs a differently named nixpkgs plugin
attribute.

Pull requests are welcome.
