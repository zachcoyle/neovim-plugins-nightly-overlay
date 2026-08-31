{
  description = "overlay for neovim plugins, updated nightly";

  inputs = {
    nixpkgs = {
      url = "git+https://github.com/NixOS/nixpkgs?ref=nixpkgs-26.05-darwin&shallow=1";
    };
    devshell = {
      url = "github:numtide/devshell/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    systems.url = "github:nix-systems/default/main";
  };

  outputs = {
    self,
    nixpkgs,
    devshell,
    systems,
    ...
  }: let
    forAllSystems = nixpkgs.lib.genAttrs (import systems);
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    devShells = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = devshell.legacyPackages.${system}.mkShell {
        name = "neovim-plugins-nightly-overlay";
        packages = [pkgs.npins];
      };
    });

    overlays.default = final: prev: let
      pins = import ./npins;
      plugins = builtins.attrNames pins;
    in {
      vimPlugins =
        prev.vimPlugins
        // builtins.listToAttrs
        (map (name: {
            inherit name;
            value = prev.vimPlugins.${name}.overrideAttrs {
              src = pins.${name};
              version = "nightly-${pins.${name}.revision}";
            };
          })
          plugins);
    };
  };
}
