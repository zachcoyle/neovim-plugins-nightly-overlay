# neovim-plugins-nightly-overlay

This overlay includes all of the plugins available through `Nixvim`, minus the ones that have their own Flake (plus a few extra popular plugins that are not yet in `Nixvim`).

## Installation

```nix
{
  inputs = {
    neovim-plugins-nightly-overlay.url = "github:zachcoyle/nix-config";
  };
}
```

```nix
nixpkgs.overlays = [
  inputs.neovim-plugins-nightly-overlay.overlays.default
];
```

## Motivation:

The plugins available in nipxkgs are updated way too slowly when using Neovim nightlies, even when running on unstable, causing extended periods of breakage. Having the plugins update nightly, independently from nixpkgs, reduces this to just the brief breakage of regular Neovim nightly usage.

## How to use:

Simply add this flake as a flake input and add the provided `neovim-plugins-nightly-overlay.overlays.default` flake output.

# Why not use an existing overlay?

The only prior art I've personally seen has all made the same design choice for the overlay, which is "incompatible" with `Nixvim`. This overlay just overrides the `src` and `version` of each included plugin rather than including a separate package set.  The benefit of this is being able to take advantage of the existing overrides in nixpkgs (which add dependencies, etc, to some plugins) as well as being plug-and-play for `Nixvim`.
