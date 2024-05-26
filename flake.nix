{
  description = "overlay for neovim plugins, updated nightly";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    hercules-ci-effects = {
      url = "github:hercules-ci/hercules-ci-effects";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alpha-nvim = {
      url = "github:goolord/alpha-nvim";
      flake = false;
    };
    arrow-nvim = {
      url = "github:otavioschwanck/arrow.nvim";
      flake = false;
    };
    auto-save-nvim = {
      url = "github:okuuva/auto-save.nvim";
      flake = false;
    };
    auto-session = {
      url = "github:rmagatti/auto-session";
      flake = false;
    };
    autoclose-nvim = {
      url = "github:m4xshen/autoclose.nvim";
      flake = false;
    };
    baleia-nvim = {
      url = "github:m00qek/baleia.nvim";
      flake = false;
    };
    barbar-nvim = {
      url = "github:romgrk/barbar.nvim";
      flake = false;
    };
    barbecue-nvim = {
      url = "github:utilyre/barbecue.nvim";
      flake = false;
    };
    base16-nvim = {
      url = "github:RRethy/base16-nvim";
      flake = false;
    };
    better-escape-nvim = {
      url = "github:max397574/better-escape.nvim";
      flake = false;
    };
    blamer-nvim = {
      url = "github:APZelos/blamer.nvim";
      flake = false;
    };
    bufferline-nvim = {
      url = "github:akinsho/bufferline.nvim";
      flake = false;
    };
    calvera-dark-nvim = {
      url = "github:yashguptaz/calvera-dark.nvim";
      flake = false;
    };
    catpuccin-nvim = {
      url = "github:catppuccin/nvim";
      flake = false;
    };
    ccc-nvim = {
      url = "github:uga-rosa/ccc.nvim";
      flake = false;
    };
    chadtree = {
      url = "github:ms-jpq/chadtree";
      flake = false;
    };
    clangd_extensions-nvim = {
      url = "github:p00f/clangd_extensions.nvim";
      flake = false;
    };
    clipboard-image-nvim = {
      url = "github:ekickx/clipboard-image.nvim";
      flake = false;
    };
    cloak-nvim = {
      url = "github:laytan/cloak.nvim";
      flake = false;
    };
    cmp-async-path = {
      # archived
      url = "github:FelipeLema/cmp-async-path";
      flake = false;
    };
    cmp-buffer = {
      url = "github:hrsh7th/cmp-buffer";
      flake = false;
    };
    cmp-calc = {
      url = "github:hrsh7th/cmp-calc";
      flake = false;
    };
    cmp-clippy = {
      url = "github:vappolinario/cmp-clippy";
      flake = false;
    };
    cmp-cmdline = {
      url = "github:hrsh7th/cmp-cmdline";
      flake = false;
    };
    cmp-cmdline-history = {
      url = "github:dmitmel/cmp-cmdline-history";
      flake = false;
    };
    cmp-conventionalcommits = {
      url = "github:davidsierradz/cmp-conventionalcommits";
      flake = false;
    };
    cmp-copilot = {
      url = "github:hrsh7th/cmp-copilot";
      flake = false;
    };
    cmp-dap = {
      url = "github:rcarriga/cmp-dap";
      flake = false;
    };
    cmp-dictionary = {
      # archived
      url = "github:uga-rosa/cmp-dictionary";
      flake = false;
    };
    cmp-digraphs = {
      url = "github:dmitmel/cmp-digraphs";
      flake = false;
    };
    cmp-emoji = {
      url = "github:hrsh7th/cmp-emoji";
      flake = false;
    };
    cmp-fish = {
      url = "github:mtoohey31/cmp-fish";
      flake = false;
    };
    cmp-fuzzy-buffer = {
      url = "github:tzachar/cmp-fuzzy-buffer";
      flake = false;
    };
    cmp-fuzzy-path = {
      url = "github:tzachar/cmp-fuzzy-path";
      flake = false;
    };
    cmp-git = {
      url = "github:petertriho/cmp-git";
      flake = false;
    };
    cmp-greek = {
      url = "github:max397574/cmp-greek";
      flake = false;
    };
    cmp-latex-symbols = {
      url = "github:kdheepak/cmp-latex-symbols";
      flake = false;
    };
    cmp-look = {
      url = "github:octaltree/cmp-look";
      flake = false;
    };
    cmp-npm = {
      url = "github:David-Kunz/cmp-npm";
      flake = false;
    };
    cmp-nvim-lsp = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };
    cmp-nvim-lsp-document-symbol = {
      url = "github:hrsh7th/cmp-nvim-lsp-document-symbol";
      flake = false;
    };
    cmp-nvim-lsp-signature-help = {
      url = "github:hrsh7th/cmp-nvim-lsp-signature-help";
      flake = false;
    };
    cmp-nvim-lua = {
      url = "github:hrsh7th/cmp-nvim-lua";
      flake = false;
    };
    cmp-nvim-ultisnips = {
      url = "github:quangnguyen30192/cmp-nvim-ultisnips";
      flake = false;
    };
    cmp-omni = {
      url = "github:hrsh7th/cmp-omni";
      flake = false;
    };
    cmp-pandoc-nvim = {
      url = "github:aspeddro/cmp-pandoc.nvim";
      flake = false;
    };
    cmp-pandoc-references = {
      url = "github:jc-doyle/cmp-pandoc-references";
      flake = false;
    };
    cmp-path = {
      url = "github:hrsh7th/cmp-path";
      flake = false;
    };
    cmp-rg = {
      url = "github:lukas-reineke/cmp-rg";
      flake = false;
    };
    cmp-snippy = {
      url = "github:dcampos/cmp-snippy";
      flake = false;
    };
    cmp-spell = {
      url = "github:f3fora/cmp-spell";
      flake = false;
    };
    cmp-tabby = {
      url = "github:nzlov/cmp-tabby";
      flake = false;
    };
    # TODO: needs override
    cmp-tabnine = {
      url = "github:tzachar/cmp-tabnine";
      flake = false;
    };
    cmp-tmux = {
      url = "github:andersevenrud/cmp-tmux";
      flake = false;
    };
    cmp-treesitter = {
      url = "github:ray-x/cmp-treesitter";
      flake = false;
    };
    cmp-vim-lsp = {
      url = "github:dmitmel/cmp-vim-lsp";
      flake = false;
    };
    cmp-vimwiki-tags = {
      url = "github:pontusk/cmp-vimwiki-tags";
      flake = false;
    };
    cmp-vsnip = {
      url = "github:hrsh7th/cmp-vsnip";
      flake = false;
    };
    cmp-zsh = {
      url = "github:tamago324/cmp-zsh";
      flake = false;
    };
    cmp_luasnip = {
      url = "github:saadparwaiz1/cmp_luasnip";
      flake = false;
    };
    cmp_yanky = {
      url = "github:chrisgrieser/cmp_yanky";
      flake = false;
    };
    comment-nvim = {
      url = "github:numToStr/Comment.nvim";
      flake = false;
    };
    completion-nvim = {
      url = "github:nvim-lua/completion-nvim";
      flake = false;
    };
    copilot-vim = {
      url = "github:github/copilot.vim";
      flake = false;
    };
    cyberdream-nvim = {
      url = "github:scottmckendry/cyberdream.nvim";
      flake = false;
    };
    dracula-nvim = {
      url = "github:Mofiqul/dracula.nvim";
      flake = false;
    };
    feline-nvim = {
      url = "github:famiu/feline.nvim";
      flake = false;
    };
    focus-vim = {
      url = "github:merlinrebrovic/focus.vim";
      flake = false;
    };
    formatter-nvim = {
      url = "github:mhartington/formatter.nvim";
      flake = false;
    };
    friendly-snippets = {
      url = "github:rafamadriz/friendly-snippets";
      flake = false;
    };
    fzf-lsp-nvim = {
      url = "github:gfanto/fzf-lsp.nvim";
      flake = false;
    };
    galaxyline-nvim = {
      url = "github:glepnir/galaxyline.nvim/main";
      flake = false;
    };
    gitsigns-nvim = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };
    goyo-vim = {
      url = "github:junegunn/goyo.vim";
      flake = false;
    };
    gruvbox-nvim = {
      url = "github:ellisonleao/gruvbox.nvim";
      flake = false;
    };
    harpoon = {
      url = "github:ThePrimeagen/harpoon";
      flake = false;
    };
    indent-blankline-nvim = {
      url = "github:lukas-reineke/indent-blankline.nvim";
      flake = false;
    };
    kanagawa-nvim = {
      url = "github:rebelot/kanagawa.nvim";
      flake = false;
    };
    leap-nvim = {
      url = "github:ggandor/leap.nvim";
      flake = false;
    };
    lsp_signature-nvim = {
      url = "github:ray-x/lsp_signature.nvim";
      flake = false;
    };
    lspkind-nvim = {
      url = "github:onsails/lspkind-nvim";
      flake = false;
    };
    lualine-nvim = {
      url = "github:nvim-lualine/lualine.nvim";
      flake = false;
    };
    LuaSnip = {
      url = "github:L3MON4D3/LuaSnip";
      flake = false;
    };
    melange = {
      url = "github:savq/melange-nvim";
      flake = false;
    };
    neogit = {
      url = "github:TimUntersberger/neogit";
      flake = false;
    };
    neon = {
      url = "github:rafamadriz/neon";
      flake = false;
    };
    neorg = {
      url = "github:vhyrro/neorg";
      flake = false;
    };
    neovim-ayu = {
      url = "github:Shatur/neovim-ayu";
      flake = false;
    };
    nord-nvim = {
      url = "github:shaunsingh/nord.nvim";
      flake = false;
    };
    nvcode-color-schemes-vim = {
      url = "github:ChristianChiarulli/nvcode-color-schemes.vim";
      flake = false;
    };
    nvim-autopairs = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };
    nvim-bacon = {
      url = "github:Canop/nvim-bacon";
      flake = false;
    };
    nvim-blame-line = {
      url = "github:tveskag/nvim-blame-line";
      flake = false;
    };
    nvim-cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
    nvim-colorizer-lua = {
      url = "github:norcalli/nvim-colorizer.lua";
      flake = false;
    };
    nvim-dap = {
      url = "github:mfussenegger/nvim-dap";
      flake = false;
    };
    nvim-dap-virtual-text = {
      url = "github:theHamsta/nvim-dap-virtual-text";
      flake = false;
    };
    nvim-jdtls = {
      url = "github:mfussenegger/nvim-jdtls";
      flake = false;
    };
    nvim-lspconfig = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };
    nvim-scrollview = {
      url = "github:dstein64/nvim-scrollview";
      flake = false;
    };
    nvim-tree-lua = {
      url = "github:kyazdani42/nvim-tree.lua";
      flake = false;
    };
    # nvim-treesitter = {
    #   url = "github:nvim-treesitter/nvim-treesitter";
    #   flake = false;
    # };
    nvim-ts-autotag = {
      url = "github:windwp/nvim-ts-autotag";
      flake = false;
    };
    nvim-ts-context-commentstring = {
      url = "github:JoosepAlviste/nvim-ts-context-commentstring";
      flake = false;
    };
    nvim-ts-rainbow = {
      url = "github:p00f/nvim-ts-rainbow";
      flake = false;
    };
    nvim-web-devicons = {
      url = "github:kyazdani42/nvim-web-devicons";
      flake = false;
    };
    octo-nvim = {
      url = "github:pwntester/octo.nvim";
      flake = false;
    };
    onedark-nvim = {
      url = "github:navarasu/onedark.nvim";
      flake = false;
    };
    oxocarbon-nvim = {
      url = "github:nyoom-engineering/oxocarbon.nvim";
      flake = false;
    };
    packer-nvim = {
      url = "github:wbthomason/packer.nvim";
      flake = false;
    };
    palette-nvim = {
      url = "github:roobert/palette.nvim";
      flake = false;
    };
    plenary-nvim = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };
    poimandres-nvim = {
      url = "github:olivercederborg/poimandres.nvim";
      flake = false;
    };
    popup-nvim = {
      url = "github:nvim-lua/popup.nvim";
      flake = false;
    };
    presence-nvim = {
      url = "github:andweeb/presence.nvim";
      flake = false;
    };
    rose-pine = {
      url = "github:rose-pine/neovim";
      flake = false;
    };
    scrollbar-nvim = {
      url = "github:Xuyuanp/scrollbar.nvim";
      flake = false;
    };
    snippets-nvim = {
      url = "github:norcalli/snippets.nvim";
      flake = false;
    };
    sql-nvim = {
      url = "github:tami5/sql.nvim";
      flake = false;
    };
    telescope-cheat-nvim = {
      url = "github:nvim-telescope/telescope-cheat.nvim";
      flake = false;
    };
    telescope-dap-nvim = {
      url = "github:nvim-telescope/telescope-dap.nvim";
      flake = false;
    };
    telescope-emoji-nvim = {
      url = "github:xiyaowong/telescope-emoji.nvim";
      flake = false;
    };
    telescope-file-browser-nvim = {
      url = "github:nvim-telescope/telescope-file-browser.nvim";
      flake = false;
    };
    telescope-frecency-nvim = {
      url = "github:nvim-telescope/telescope-frecency.nvim";
      flake = false;
    };
    telescope-fzf-writer-nvim = {
      url = "github:nvim-telescope/telescope-fzf-writer.nvim";
      flake = false;
    };
    telescope-fzy-native-nvim = {
      url = "github:nvim-telescope/telescope-fzy-native.nvim";
      flake = false;
    };
    telescope-ghq-nvim = {
      url = "github:nvim-telescope/telescope-ghq.nvim";
      flake = false;
    };
    telescope-github-nvim = {
      url = "github:nvim-telescope/telescope-github.nvim";
      flake = false;
    };
    telescope-media-files-nvim = {
      url = "github:nvim-telescope/telescope-media-files.nvim";
      flake = false;
    };
    telescope-node-modules-nvim = {
      url = "github:nvim-telescope/telescope-node-modules.nvim";
      flake = false;
    };
    telescope-nvim = {
      url = "github:nvim-telescope/telescope.nvim";
      flake = false;
    };
    telescope-packer-nvim = {
      url = "github:nvim-telescope/telescope-packer.nvim";
      flake = false;
    };
    telescope-project-nvim = {
      url = "github:nvim-telescope/telescope-project.nvim";
      flake = false;
    };
    telescope-snippets-nvim = {
      url = "github:nvim-telescope/telescope-snippets.nvim";
      flake = false;
    };
    telescope-symbols-nvim = {
      url = "github:nvim-telescope/telescope-symbols.nvim";
      flake = false;
    };
    telescope-vimspector-nvim = {
      url = "github:nvim-telescope/telescope-vimspector.nvim";
      flake = false;
    };
    telescope-z-nvim = {
      url = "github:nvim-telescope/telescope-z.nvim";
      flake = false;
    };
    toggleterm-nvim = {
      url = "github:akinsho/toggleterm.nvim";
      flake = false;
    };
    tokyonight-nvim = {
      url = "github:folke/tokyonight.nvim";
      flake = false;
    };
    trouble-nvim = {
      url = "github:folke/trouble.nvim";
      flake = false;
    };
    vim-airline = {
      url = "github:vim-airline/vim-airline";
      flake = false;
    };
    vim-dadbod-ui = {
      url = "github:kristijanhusak/vim-dadbod-ui";
      flake = false;
    };
    vim-devicons = {
      url = "github:ryanoasis/vim-devicons";
      flake = false;
    };
    vim-import-cost = {
      url = "github:yardnsm/vim-import-cost";
      flake = false;
    };
    vim-one = {
      url = "github:rakr/vim-one";
      flake = false;
    };
    vim-prisma = {
      url = "github:pantharshit00/vim-prisma";
      flake = false;
    };
    vim-repl = {
      url = "github:sillybun/vim-repl";
      flake = false;
    };
    vim-vsnip = {
      url = "github:hrsh7th/vim-vsnip";
      flake = false;
    };
    vim-vsnip-integ = {
      url = "github:hrsh7th/vim-vsnip-integ";
      flake = false;
    };
    vim-which-key = {
      url = "github:liuchengxu/vim-which-key";
      flake = false;
    };
    vscode-nvim = {
      url = "github:Mofiqul/vscode.nvim";
      flake = false;
    };
    which-key-nvim = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    devshell,
    flake-parts,
    hercules-ci-effects,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.hercules-ci-effects.flakeModule
      ];

      perSystem = {
        config,
        pkgs,
        ...
      }: {
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

        formatter = pkgs.alejandra;
      };
      flake = {
        # TODO: probably better to just override the src for each plugin so that the overrides aren't messed with
        overlays.default = final: prev: let
          inherit (prev.vimUtils) buildVimPluginFrom2Nix;

          buildVimPluginFromInputs = name:
            buildVimPluginFrom2Nix {
              pname = name;
              version = "nightly";
              src = builtins.getAttr name inputs;
            };

          plugins =
            builtins.filter
            (name:
              name
              != "self"
              && name != "nixpkgs"
              && name != "devshell"
              && name != "flake-parts"
              && name != "hercules-ci-effects")
            (builtins.attrNames inputs);
        in {
          vimPlugins =
            prev.vimPlugins
            // builtins.listToAttrs
            (map (name: {
                inherit name;
                value = buildVimPluginFromInputs name;
              })
              plugins);
        };
      };
    };
}
