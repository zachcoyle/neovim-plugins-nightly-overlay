{
  description = "Nightly Neovim plugins compatible with Nixvim and nixpkgs";

  inputs = {
    nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?ref=nixpkgs-26.05-darwin&shallow=1";

    devshell = {
      url = "github:numtide/devshell/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "git+https://github.com/nix-community/nixvim?ref=nixos-26.05&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    systems.url = "github:nix-systems/default/main";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      devshell,
      nixvim,
      systems,
      ...
    }:
    let
      inherit (nixpkgs) lib;

      supportedSystems = import systems;
      forAllSystems = lib.genAttrs supportedSystems;

      pinSet = import ./npins;
      pinNames = builtins.filter (name: pinSet.${name} ? revision) (builtins.attrNames pinSet);
      sourceAliases = import ./source-aliases.nix;
      aliasSources = builtins.attrValues sourceAliases;
      directPinNames = builtins.filter (name: !(builtins.elem name aliasSources)) pinNames;
      pluginSources = lib.genAttrs directPinNames (name: name) // sourceAliases;

      treesitterFamily = [
        "nvim-treesitter"
        "nvim-treesitter-textobjects"
        "nvim-treesitter-context"
        "nvim-treesitter-refactor"
        "nvim-treesitter-playground"
      ];

      excludedPlugins = treesitterFamily ++ [ "harpoon2" ];

      nightlyPluginSources = builtins.removeAttrs pluginSources excludedPlugins;

      shortRevision = pin: builtins.substring 0 12 pin.revision;

      mkPlugin =
        pkgs: previousPlugins: targetName: sourceName:
        let
          pin = pinSet.${sourceName};
          previous =
            if builtins.hasAttr targetName previousPlugins then
              builtins.tryEval previousPlugins.${targetName}
            else
              {
                success = false;
                value = null;
              };
          common = old: {
            src = pin;
            version = "nightly-${shortRevision pin}";
            __intentionallyOverridingVersion = true;
            passthru = (old.passthru or { }) // {
              nightlyOverlay = {
                inherit sourceName;
                revision = pin.revision;
              };
            };
          };
        in
        if previous.success && lib.isDerivation previous.value then
          previous.value.overrideAttrs common
        else
          pkgs.vimUtils.buildVimPlugin (
            (common { })
            // {
              pname = targetName;
            }
          );

      overlay = _final: prev: {
        # Extend nixpkgs' recursive plugin scope instead of merging a completed
        # attrset. This preserves nixpkgs overrides while rebinding dependencies
        # such as textobjects -> treesitter to their nightly counterparts.
        vimPlugins = prev.vimPlugins.extend (
          _finalPlugins: previousPlugins:
          lib.mapAttrs (
            targetName: sourceName: mkPlugin prev previousPlugins targetName sourceName
          ) nightlyPluginSources
        );
      };

      collectNixvimPackages =
        value:
        if builtins.isAttrs value && value ? _type && value._type == "option" then
          let
            attempted =
              if value ? default then
                builtins.tryEval value.default
              else
                {
                  success = false;
                  value = null;
                };
          in
          lib.optional (
            attempted.success
            && builtins.isAttrs attempted.value
            && attempted.value ? passthru
            && (attempted.value.passthru.vimPlugin or false)
          ) attempted.value
        else if builtins.isAttrs value then
          lib.concatMap collectNixvimPackages (builtins.attrValues value)
        else
          [ ];

      nixvimPackagesFor =
        system:
        let
          evaluation = nixvim.legacyPackages.${system}.nixvimConfiguration.extendModules {
            modules = [
              {
                nixpkgs.overlays = [ overlay ];
              }
            ];
          };
        in
        collectNixvimPackages evaluation.options.plugins;

      uncoveredNixvimPackagesFor =
        system:
        builtins.filter (
          package:
          let
            attempted = builtins.tryEval (lib.hasPrefix "nightly-" package.version);
          in
          attempted.success && !attempted.value
        ) (nixvimPackagesFor system);
    in
    {
      overlays.default = overlay;

      lib = {
        inherit pinNames pluginSources supportedSystems;
        nixpkgsSource = nixpkgs.outPath;
        nixvimPackages = forAllSystems nixvimPackagesFor;
        uncoveredNixvimPackages = forAllSystems uncoveredNixvimPackagesFor;
      };

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = devshell.legacyPackages.${system}.mkShell {
            name = "neovim-plugins-nightly-overlay";
            packages = with pkgs; [
              alejandra
              jq
              npins
              python3
              ripgrep
            ];
          };
        }
      );

      checks = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system}.extend overlay;
          overlayPackages = lib.attrVals (builtins.attrNames pluginSources) pkgs.vimPlugins;
          invalidPackages = builtins.filter (
            package:
            !(lib.isDerivation package)
            || !(lib.hasPrefix "nightly-" package.version)
            || !(package.passthru ? nightlyOverlay)
          ) overlayPackages;
          uncovered = uncoveredNixvimPackagesFor system;
          uncoveredNames = map (package: package.pname or package.name) uncovered;
        in
        {
          formatting = pkgs.runCommand "formatting" { nativeBuildInputs = [ pkgs.alejandra ]; } ''
            alejandra --check ${./flake.nix} ${./source-aliases.nix}
            touch $out
          '';

          overlay-evaluates =
            assert lib.assertMsg (invalidPackages == [ ]) "The overlay produced invalid plugin packages";
            pkgs.runCommand "overlay-evaluates" { } "touch $out";

          nixvim-coverage =
            assert lib.assertMsg (uncovered == [ ]) ''
              Nixvim packages missing from the nightly overlay:
              ${lib.concatStringsSep "\n" uncoveredNames}
            '';
            pkgs.runCommand "nixvim-coverage" { } "touch $out";

          # Guard a dependency-sensitive package: textobjects must load against the
          # nightly treesitter selected through nixpkgs' recursive plugin scope,
          # while the generated all-grammars catalog remains internally atomic.
          plugin-compatibility = pkgs.runCommand "plugin-compatibility" {
            nativeBuildInputs = [
              pkgs.vimPlugins.nvim-treesitter-textobjects
              pkgs.vimPlugins.nvim-treesitter.withAllGrammars
            ];
          } "touch $out";
        }
      );
    };
}
