{
  description = "overlay for neovim plugins, updated nightly";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    devshell = {
      url = "github:numtide/devshell/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts/main";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    hercules-ci-effects = {
      url = "github:hercules-ci/hercules-ci-effects";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    systems.url = "github:nix-systems/default/main";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    devshell,
    flake-parts,
    hercules-ci-effects,
    systems,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import systems;
      imports = [
        inputs.devshell.flakeModule
        inputs.hercules-ci-effects.flakeModule
      ];

      hercules-ci.flake-update = {
        enable = true;
        baseMerge.enable = true;
        baseMerge.method = "rebase";
        autoMergeMethod = "rebase";
        when = {
          hour = [0];
          minute = 0;
        };
      };

      perSystem = {
        config,
        pkgs,
        ...
      }: {
        formatter = pkgs.alejandra;

        devshells.default = {
          name = "neovim-plugins-nightly-overlay";
          packages = with pkgs; [
            npins
          ];
        };
      };
      flake = {
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
    };
}
