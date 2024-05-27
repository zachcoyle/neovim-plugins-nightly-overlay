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
    systems.url = "github:nix-systems/default";

    # FIXME: for whatever reason, this one constantly gives a NAR hash mismatch
    # lsp_lines-nvim.flake = false;
    # lsp_lines-nvim.url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim";
    alpha-nvim.flake = false;
    alpha-nvim.url = "github:goolord/alpha-nvim";
    arrow-nvim.flake = false;
    arrow-nvim.url = "github:otavioschwanck/arrow.nvim";
    auto-save-nvim.flake = false;
    auto-save-nvim.url = "github:okuuva/auto-save.nvim";
    auto-session.flake = false;
    auto-session.url = "github:rmagatti/auto-session";
    autoclose-nvim.flake = false;
    autoclose-nvim.url = "github:m4xshen/autoclose.nvim";
    baleia-nvim.flake = false;
    baleia-nvim.url = "github:m00qek/baleia.nvim";
    barbar-nvim.flake = false;
    barbar-nvim.url = "github:romgrk/barbar.nvim";
    barbecue-nvim.flake = false;
    barbecue-nvim.url = "github:utilyre/barbecue.nvim";
    base16-nvim.flake = false;
    base16-nvim.url = "github:RRethy/base16-nvim";
    better-escape-nvim.flake = false;
    better-escape-nvim.url = "github:max397574/better-escape.nvim";
    blamer-nvim.flake = false;
    blamer-nvim.url = "github:APZelos/blamer.nvim";
    bufferline-nvim.flake = false;
    bufferline-nvim.url = "github:akinsho/bufferline.nvim";
    calvera-dark-nvim.flake = false;
    calvera-dark-nvim.url = "github:yashguptaz/calvera-dark.nvim";
    catpuccin-nvim.flake = false;
    catpuccin-nvim.url = "github:catppuccin/nvim";
    ccc-nvim.flake = false;
    ccc-nvim.url = "github:uga-rosa/ccc.nvim";
    chadtree.flake = false;
    chadtree.url = "github:ms-jpq/chadtree";
    clangd_extensions-nvim.flake = false;
    clangd_extensions-nvim.url = "github:p00f/clangd_extensions.nvim";
    clipboard-image-nvim.flake = false;
    clipboard-image-nvim.url = "github:ekickx/clipboard-image.nvim";
    cloak-nvim.flake = false;
    cloak-nvim.url = "github:laytan/cloak.nvim";
    cmp-async-path.flake = false;
    cmp-async-path.url = "github:FelipeLema/cmp-async-path";
    cmp-buffer.flake = false;
    cmp-buffer.url = "github:hrsh7th/cmp-buffer";
    cmp-calc.flake = false;
    cmp-calc.url = "github:hrsh7th/cmp-calc";
    cmp-clippy.flake = false;
    cmp-clippy.url = "github:vappolinario/cmp-clippy";
    cmp-cmdline-history.flake = false;
    cmp-cmdline-history.url = "github:dmitmel/cmp-cmdline-history";
    cmp-cmdline.flake = false;
    cmp-cmdline.url = "github:hrsh7th/cmp-cmdline";
    cmp-conventionalcommits.flake = false;
    cmp-conventionalcommits.url = "github:davidsierradz/cmp-conventionalcommits";
    cmp-copilot.flake = false;
    cmp-copilot.url = "github:hrsh7th/cmp-copilot";
    cmp-dap.flake = false;
    cmp-dap.url = "github:rcarriga/cmp-dap";
    cmp-dictionary.flake = false;
    cmp-dictionary.url = "github:uga-rosa/cmp-dictionary";
    cmp-digraphs.flake = false;
    cmp-digraphs.url = "github:dmitmel/cmp-digraphs";
    cmp-emoji.flake = false;
    cmp-emoji.url = "github:hrsh7th/cmp-emoji";
    cmp-fish.flake = false;
    cmp-fish.url = "github:mtoohey31/cmp-fish";
    cmp-fuzzy-buffer.flake = false;
    cmp-fuzzy-buffer.url = "github:tzachar/cmp-fuzzy-buffer";
    cmp-fuzzy-path.flake = false;
    cmp-fuzzy-path.url = "github:tzachar/cmp-fuzzy-path";
    cmp-git.flake = false;
    cmp-git.url = "github:petertriho/cmp-git";
    cmp-greek.flake = false;
    cmp-greek.url = "github:max397574/cmp-greek";
    cmp-latex-symbols.flake = false;
    cmp-latex-symbols.url = "github:kdheepak/cmp-latex-symbols";
    cmp-look.flake = false;
    cmp-look.url = "github:octaltree/cmp-look";
    cmp-npm.flake = false;
    cmp-npm.url = "github:David-Kunz/cmp-npm";
    cmp-nvim-lsp-document-symbol.flake = false;
    cmp-nvim-lsp-document-symbol.url = "github:hrsh7th/cmp-nvim-lsp-document-symbol";
    cmp-nvim-lsp-signature-help.flake = false;
    cmp-nvim-lsp-signature-help.url = "github:hrsh7th/cmp-nvim-lsp-signature-help";
    cmp-nvim-lsp.flake = false;
    cmp-nvim-lsp.url = "github:hrsh7th/cmp-nvim-lsp";
    cmp-nvim-lua.flake = false;
    cmp-nvim-lua.url = "github:hrsh7th/cmp-nvim-lua";
    cmp-nvim-ultisnips.flake = false;
    cmp-nvim-ultisnips.url = "github:quangnguyen30192/cmp-nvim-ultisnips";
    cmp-omni.flake = false;
    cmp-omni.url = "github:hrsh7th/cmp-omni";
    cmp-pandoc-nvim.flake = false;
    cmp-pandoc-nvim.url = "github:aspeddro/cmp-pandoc.nvim";
    cmp-pandoc-references.flake = false;
    cmp-pandoc-references.url = "github:jc-doyle/cmp-pandoc-references";
    cmp-path.flake = false;
    cmp-path.url = "github:hrsh7th/cmp-path";
    cmp-rg.flake = false;
    cmp-rg.url = "github:lukas-reineke/cmp-rg";
    cmp-snippy.flake = false;
    cmp-snippy.url = "github:dcampos/cmp-snippy";
    cmp-spell.flake = false;
    cmp-spell.url = "github:f3fora/cmp-spell";
    cmp-tabby.flake = false;
    cmp-tabby.url = "github:nzlov/cmp-tabby";
    cmp-tabnine.flake = false;
    cmp-tabnine.url = "github:tzachar/cmp-tabnine";
    cmp-tmux.flake = false;
    cmp-tmux.url = "github:andersevenrud/cmp-tmux";
    cmp-treesitter.flake = false;
    cmp-treesitter.url = "github:ray-x/cmp-treesitter";
    cmp-vim-lsp.flake = false;
    cmp-vim-lsp.url = "github:dmitmel/cmp-vim-lsp";
    cmp-vimwiki-tags.flake = false;
    cmp-vimwiki-tags.url = "github:pontusk/cmp-vimwiki-tags";
    cmp-vsnip.flake = false;
    cmp-vsnip.url = "github:hrsh7th/cmp-vsnip";
    cmp-zsh.flake = false;
    cmp-zsh.url = "github:tamago324/cmp-zsh";
    cmp_luasnip.flake = false;
    cmp_luasnip.url = "github:saadparwaiz1/cmp_luasnip";
    cmp_yanky.flake = false;
    cmp_yanky.url = "github:chrisgrieser/cmp_yanky";
    codeium-nvim.flake = false;
    codeium-nvim.url = "github:Exafunction/codeium.nvim";
    codeium-vim.flake = false;
    codeium-vim.url = "github:Exafunction/codeium.vim";
    comment-nvim.flake = false;
    comment-nvim.url = "github:numToStr/Comment.nvim";
    committia-vim.flake = false;
    committia-vim.url = "github:rhysd/committia.vim";
    competitest-nvim.flake = false;
    competitest-nvim.url = "github:xeluxee/competitest.nvim";
    completion-nvim.flake = false;
    completion-nvim.url = "github:nvim-lua/completion-nvim";
    conform-nvim.flake = false;
    conform-nvim.url = "github:stevearc/conform.nvim";
    conjure.flake = false;
    conjure.url = "github:Olical/conjure";
    copilot-cmp.flake = false;
    copilot-cmp.url = "github:zbirenbaum/copilot-cmp";
    copilot-lua.flake = false;
    copilot-lua.url = "github:zbirenbaum/copilot.lua";
    copilot-vim.flake = false;
    copilot-vim.url = "github:github/copilot.vim";
    coq-nvim.flake = false;
    coq-nvim.url = "github:ms-jpq/coq_nvim";
    coq-thirdparty.flake = false;
    coq-thirdparty.url = "github:ms-jpq/coq.thirdparty";
    crates-nvim.flake = false;
    crates-nvim.url = "github:Saecki/crates.nvim";
    cyberdream-nvim.flake = false;
    cyberdream-nvim.url = "github:scottmckendry/cyberdream.nvim";
    dashboard-nvim.flake = false;
    dashboard-nvim.url = "github:nvimdev/dashboard-nvim";
    debugprint-nvim.flake = false;
    debugprint-nvim.url = "github:andrewferrier/debugprint.nvim";
    diffview-nvim.flake = false;
    diffview-nvim.url = "github:sindrets/diffview.nvim";
    direnv-vim.flake = false;
    direnv-vim.url = "github:direnv/direnv.vim";
    dracula-nvim.flake = false;
    dracula-nvim.url = "github:Mofiqul/dracula.nvim";
    dressing-nvim.flake = false;
    dressing-nvim.url = "github:stevearc/dressing.nvim";
    efmls-configs-nvim.flake = false;
    efmls-configs-nvim.url = "github:creativenull/efmls-configs-nvim";
    emmet-vim.flake = false;
    emmet-vim.url = "github:mattn/emmet-vim";
    feline-nvim.flake = false;
    feline-nvim.url = "github:famiu/feline.nvim";
    fidget-nvim.flake = false;
    fidget-nvim.url = "github:j-hui/fidget.nvim";
    flash-nvim.flake = false;
    flash-nvim.url = "github:folke/flash.nvim";
    focus-vim.flake = false;
    focus-vim.url = "github:merlinrebrovic/focus.vim";
    formatter-nvim.flake = false;
    formatter-nvim.url = "github:mhartington/formatter.nvim";
    friendly-snippets.flake = false;
    friendly-snippets.url = "github:rafamadriz/friendly-snippets";
    fzf-lsp-nvim.flake = false;
    fzf-lsp-nvim.url = "github:gfanto/fzf-lsp.nvim";
    fzf-lua.flake = false;
    fzf-lua.url = "github:ibhagwan/fzf-lua";
    galaxyline-nvim.flake = false;
    galaxyline-nvim.url = "github:glepnir/galaxyline.nvim/main";
    git-blame-nvim.flake = false;
    git-blame-nvim.url = "github:f-person/git-blame.nvim";
    git-messenger-vim.flake = false;
    git-messenger-vim.url = "github:rhysd/git-messenger.vim";
    git-worktree-nvim.flake = false;
    git-worktree-nvim.url = "github:ThePrimeagen/git-worktree.nvim";
    gitignore-nvim.flake = false;
    gitignore-nvim.url = "github:wintermute-cell/gitignore.nvim";
    gitlinker-nvim.flake = false;
    gitlinker-nvim.url = "github:ruifm/gitlinker.nvim";
    gitsigns-nvim.flake = false;
    gitsigns-nvim.url = "github:lewis6991/gitsigns.nvim";
    goyo-vim.flake = false;
    goyo-vim.url = "github:junegunn/goyo.vim";
    gruvbox-nvim.flake = false;
    gruvbox-nvim.url = "github:ellisonleao/gruvbox.nvim";
    hardtime-nvim.flake = false;
    hardtime-nvim.url = "github:m4xshen/hardtime.nvim";
    harpoon.flake = false;
    harpoon.url = "github:ThePrimeagen/harpoon";
    haskell-scope-highlighting-nvim.flake = false;
    haskell-scope-highlighting-nvim.url = "github:kiyoon/haskell-scope-highlighting.nvim";
    headlines-nvim.flake = false;
    headlines-nvim.url = "github:lukas-reineke/headlines.nvim";
    hmts-nvim.flake = false;
    hmts-nvim.url = "github:calops/hmts.nvim";
    hop-nvim.flake = false;
    hop-nvim.url = "github:smoka7/hop.nvim";
    hydra-nvim.flake = false;
    hydra-nvim.url = "github:nvimtools/hydra.nvim";
    image-nvim.flake = false;
    image-nvim.url = "github:3rd/image.nvim";
    improved-search-nvim.flake = false;
    improved-search-nvim.url = "github:backdround/improved-search.nvim";
    inc-rename-nvim.flake = false;
    inc-rename-nvim.url = "github:smjonas/inc-rename.nvim";
    indent-blankline-nvim.flake = false;
    indent-blankline-nvim.url = "github:lukas-reineke/indent-blankline.nvim";
    indent-o-matic.flake = false;
    indent-o-matic.url = "github:Darazaki/indent-o-matic";
    instant-nvim.flake = false;
    instant-nvim.url = "github:jbyuki/instant.nvim";
    intellitab-nvim.flake = false;
    intellitab-nvim.url = "github:pta2002/intellitab.nvim";
    jupytext.flake = false;
    jupytext.url = "github:GCBallesteros/jupytext.nvim";
    kanagawa-nvim.flake = false;
    kanagawa-nvim.url = "github:rebelot/kanagawa.nvim";
    lazy-nvim.flake = false;
    lazy-nvim.url = "github:folke/lazy.nvim";
    lazygit-nvim.flake = false;
    lazygit-nvim.url = "github:kdheepak/lazygit.nvim";
    lean-nvim.flake = false;
    lean-nvim.url = "github:Julian/lean.nvim";
    leap-nvim.flake = false;
    leap-nvim.url = "github:ggandor/leap.nvim";
    lightline-vim.flake = false;
    lightline-vim.url = "github:itchyny/lightline.vim";
    lsp-format-nvim.flake = false;
    lsp-format-nvim.url = "github:lukas-reineke/lsp-format.nvim";
    lsp_signature-nvim.flake = false;
    lsp_signature-nvim.url = "github:ray-x/lsp_signature.nvim";
    lspkind-nvim.flake = false;
    lspkind-nvim.url = "github:onsails/lspkind-nvim";
    lspsaga-nvim.flake = false;
    lspsaga-nvim.url = "github:nvimdev/lspsaga.nvim";
    ltex_extra-nvim.flake = false;
    ltex_extra-nvim.url = "github:barreiroleo/ltex_extra.nvim";
    lualine-nvim.flake = false;
    lualine-nvim.url = "github:nvim-lualine/lualine.nvim";
    luasnip.flake = false;
    luasnip.url = "github:L3MON4D3/LuaSnip";
    magma-nvim-goose.flake = false;
    magma-nvim-goose.url = "github:WhiteBlackGoose/magma-nvim-goose";
    mark-radar-nvim.flake = false;
    mark-radar-nvim.url = "github:winston0410/mark-radar.nvim";
    markdown-preview-nvim.flake = false;
    markdown-preview-nvim.url = "github:iamcco/markdown-preview.nvim";
    marks-nvim.flake = false;
    marks-nvim.url = "github:chentoast/marks.nvim";
    melange.flake = false;
    melange.url = "github:savq/melange-nvim";
    mini-nvim.flake = false;
    mini-nvim.url = "github:echasnovski/mini.nvim";
    mkdnflow-nvim.flake = false;
    mkdnflow-nvim.url = "github:jakewvincent/mkdnflow.nvim";
    molten-nvim.flake = false;
    molten-nvim.url = "github:benlubas/molten-nvim";
    multicursors-nvim.flake = false;
    multicursors-nvim.url = "github:smoka7/multicursors.nvim";
    neo-tree-nvim.flake = false;
    neo-tree-nvim.url = "github:nvim-neo-tree/neo-tree.nvim";
    neocord.flake = false;
    neocord.url = "github:IogaMaster/neocord";
    neogen.flake = false;
    neogen.url = "github:danymat/neogen";
    neogit.flake = false;
    neogit.url = "github:TimUntersberger/neogit";
    neon.flake = false;
    neon.url = "github:rafamadriz/neon";
    neorg.flake = false;
    neorg.url = "github:vhyrro/neorg";
    neoscroll-nvim.flake = false;
    neoscroll-nvim.url = "github:karb94/neoscroll.nvim";
    neotest.flake = false;
    neotest.url = "github:nvim-neotest/neotest";
    neovim-ayu.flake = false;
    neovim-ayu.url = "github:Shatur/neovim-ayu";
    netman-nvim.flake = false;
    netman-nvim.url = "github:miversen33/netman.nvim";
    nix-develop-nvim.flake = false;
    nix-develop-nvim.url = "github:figsoda/nix-develop.nvim";
    noice-nvim.flake = false;
    noice-nvim.url = "github:folke/noice.nvim";
    none-ls-nvim.flake = false;
    none-ls-nvim.url = "github:nvimtools/none-ls.nvim";
    nord-nvim.flake = false;
    nord-nvim.url = "github:shaunsingh/nord.nvim";
    nvcode-color-schemes-vim.flake = false;
    nvcode-color-schemes-vim.url = "github:ChristianChiarulli/nvcode-color-schemes.vim";
    nvim-autopairs.flake = false;
    nvim-autopairs.url = "github:windwp/nvim-autopairs";
    nvim-bacon.flake = false;
    nvim-bacon.url = "github:Canop/nvim-bacon";
    nvim-blame-line.flake = false;
    nvim-blame-line.url = "github:tveskag/nvim-blame-line";
    nvim-bqf.flake = false;
    nvim-bqf.url = "github:kevinhwang91/nvim-bqf";
    nvim-cmp.flake = false;
    nvim-cmp.url = "github:hrsh7th/nvim-cmp";
    nvim-colorizer-lua.flake = false;
    nvim-colorizer-lua.url = "github:NvChad/nvim-colorizer.lua";
    nvim-coverage.flake = false;
    nvim-coverage.url = "github:andythigpen/nvim-coverage";
    nvim-cursorline.flake = false;
    nvim-cursorline.url = "github:yamatsum/nvim-cursorline";
    nvim-dap-virtual-text.flake = false;
    nvim-dap-virtual-text.url = "github:theHamsta/nvim-dap-virtual-text";
    nvim-dap.flake = false;
    nvim-dap.url = "github:mfussenegger/nvim-dap";
    nvim-jdtls.flake = false;
    nvim-jdtls.url = "github:mfussenegger/nvim-jdtls";
    nvim-lastplace.flake = false;
    nvim-lastplace.url = "github:ethanholz/nvim-lastplace";
    nvim-lightbulb.flake = false;
    nvim-lightbulb.url = "github:kosayoda/nvim-lightbulb";
    nvim-lint.flake = false;
    nvim-lint.url = "github:mfussenegger/nvim-lint";
    nvim-lspconfig.flake = false;
    nvim-lspconfig.url = "github:neovim/nvim-lspconfig";
    nvim-navbuddy.flake = false;
    nvim-navbuddy.url = "github:SmiteshP/nvim-navbuddy";
    nvim-navic.flake = false;
    nvim-navic.url = "github:SmiteshP/nvim-navic";
    nvim-notify.flake = false;
    nvim-notify.url = "github:rcarriga/nvim-notify";
    nvim-osc52.flake = false;
    nvim-osc52.url = "github:ojroques/nvim-osc52";
    nvim-scrollview.flake = false;
    nvim-scrollview.url = "github:dstein64/nvim-scrollview";
    nvim-spectre.flake = false;
    nvim-spectre.url = "github:nvim-pack/nvim-spectre";
    nvim-spider.flake = false;
    nvim-spider.url = "github:chrisgrieser/nvim-spider";
    nvim-tree-lua.flake = false;
    nvim-tree-lua.url = "github:nvim-tree/nvim-tree.lua";
    nvim-treesitter-context.flake = false;
    nvim-treesitter-context.url = "github:nvim-treesitter/nvim-treesitter-context";
    nvim-treesitter-refactor.flake = false;
    nvim-treesitter-refactor.url = "github:nvim-treesitter/nvim-treesitter-refactor";
    nvim-treesitter-textobjects.flake = false;
    nvim-treesitter-textobjects.url = "github:nvim-treesitter/nvim-treesitter-textobjects";
    nvim-treesitter.flake = false;
    nvim-treesitter.url = "github:nvim-treesitter/nvim-treesitter";
    nvim-ts-autotag.flake = false;
    nvim-ts-autotag.url = "github:windwp/nvim-ts-autotag";
    nvim-ts-context-commentstring.flake = false;
    nvim-ts-context-commentstring.url = "github:JoosepAlviste/nvim-ts-context-commentstring";
    nvim-ts-rainbow.flake = false;
    nvim-ts-rainbow.url = "github:p00f/nvim-ts-rainbow";
    nvim-ufo.flake = false;
    nvim-ufo.url = "github:kevinhwang91/nvim-ufo";
    nvim-web-devicons.flake = false;
    nvim-web-devicons.url = "github:kyazdani42/nvim-web-devicons";
    obsidian-nvim.flake = false;
    obsidian-nvim.url = "github:epwalsh/obsidian.nvim";
    octo-nvim.flake = false;
    octo-nvim.url = "github:pwntester/octo.nvim";
    oil-nvim.flake = false;
    oil-nvim.url = "github:stevearc/oil.nvim";
    ollama-nvim.flake = false;
    ollama-nvim.url = "github:nomnivore/ollama.nvim";
    onedark-nvim.flake = false;
    onedark-nvim.url = "github:navarasu/onedark.nvim";
    openscad-nvim.flake = false;
    openscad-nvim.url = "github:salkin-mada/openscad.nvim";
    oxocarbon-nvim.flake = false;
    oxocarbon-nvim.url = "github:nyoom-engineering/oxocarbon.nvim";
    packer-nvim.flake = false;
    packer-nvim.url = "github:wbthomason/packer.nvim";
    palette-nvim.flake = false;
    palette-nvim.url = "github:roobert/palette.nvim";
    persistence-nvim.flake = false;
    persistence-nvim.url = "github:folke/persistence.nvim";
    plantuml-syntax.flake = false;
    plantuml-syntax.url = "github:aklt/plantuml-syntax";
    plenary-nvim.flake = false;
    plenary-nvim.url = "github:nvim-lua/plenary.nvim";
    poimandres-nvim.flake = false;
    poimandres-nvim.url = "github:olivercederborg/poimandres.nvim";
    popup-nvim.flake = false;
    popup-nvim.url = "github:nvim-lua/popup.nvim";
    presence-nvim.flake = false;
    presence-nvim.url = "github:andweeb/presence.nvim";
    project-nvim.flake = false;
    project-nvim.url = "github:ahmedkhalf/project.nvim";
    qmk-nvim.flake = false;
    qmk-nvim.url = "github:codethread/qmk.nvim";
    quickmath-nvim.flake = false;
    quickmath-nvim.url = "github:jbyuki/quickmath.nvim";
    rainbow-delimiters-nvim.flake = false;
    rainbow-delimiters-nvim.url = "github:HiPhish/rainbow-delimiters.nvim";
    refactoring-nvim.flake = false;
    refactoring-nvim.url = "github:ThePrimeagen/refactoring.nvim";
    rest-nvim.flake = false;
    rest-nvim.url = "github:rest-nvim/rest.nvim";
    rose-pine.flake = false;
    rose-pine.url = "github:rose-pine/neovim";
    scrollbar-nvim.flake = false;
    scrollbar-nvim.url = "github:Xuyuanp/scrollbar.nvim";
    smart-splits-nvim.flake = false;
    smart-splits-nvim.url = "github:mrjones2014/smart-splits.nvim";
    snippets-nvim.flake = false;
    snippets-nvim.url = "github:norcalli/snippets.nvim";
    sniprun.flake = false;
    sniprun.url = "github:michaelb/sniprun";
    specs-nvim.flake = false;
    specs-nvim.url = "github:edluffy/specs.nvim";
    sql-nvim.flake = false;
    sql-nvim.url = "github:tami5/sql.nvim";
    startup-nvim.flake = false;
    startup-nvim.url = "github:startup-nvim/startup.nvim";
    statuscol-nvim.flake = false;
    statuscol-nvim.url = "github:luukvbaal/statuscol.nvim";
    tagbar.flake = false;
    tagbar.url = "github:preservim/tagbar";
    telescope-cheat-nvim.flake = false;
    telescope-cheat-nvim.url = "github:nvim-telescope/telescope-cheat.nvim";
    telescope-dap-nvim.flake = false;
    telescope-dap-nvim.url = "github:nvim-telescope/telescope-dap.nvim";
    telescope-emoji-nvim.flake = false;
    telescope-emoji-nvim.url = "github:xiyaowong/telescope-emoji.nvim";
    telescope-file-browser-nvim.flake = false;
    telescope-file-browser-nvim.url = "github:nvim-telescope/telescope-file-browser.nvim";
    telescope-frecency-nvim.flake = false;
    telescope-frecency-nvim.url = "github:nvim-telescope/telescope-frecency.nvim";
    telescope-fzf-native-nvim.flake = false;
    telescope-fzf-native-nvim.url = "github:nvim-telescope/telescope-fzf-native.nvim";
    telescope-fzf-writer-nvim.flake = false;
    telescope-fzf-writer-nvim.url = "github:nvim-telescope/telescope-fzf-writer.nvim";
    telescope-fzy-native-nvim.flake = false;
    telescope-fzy-native-nvim.url = "github:nvim-telescope/telescope-fzy-native.nvim";
    telescope-ghq-nvim.flake = false;
    telescope-ghq-nvim.url = "github:nvim-telescope/telescope-ghq.nvim";
    telescope-github-nvim.flake = false;
    telescope-github-nvim.url = "github:nvim-telescope/telescope-github.nvim";
    telescope-media-files-nvim.flake = false;
    telescope-media-files-nvim.url = "github:nvim-telescope/telescope-media-files.nvim";
    telescope-node-modules-nvim.flake = false;
    telescope-node-modules-nvim.url = "github:nvim-telescope/telescope-node-modules.nvim";
    telescope-nvim.flake = false;
    telescope-nvim.url = "github:nvim-telescope/telescope.nvim";
    telescope-packer-nvim.flake = false;
    telescope-packer-nvim.url = "github:nvim-telescope/telescope-packer.nvim";
    telescope-project-nvim.flake = false;
    telescope-project-nvim.url = "github:nvim-telescope/telescope-project.nvim";
    telescope-snippets-nvim.flake = false;
    telescope-snippets-nvim.url = "github:nvim-telescope/telescope-snippets.nvim";
    telescope-symbols-nvim.flake = false;
    telescope-symbols-nvim.url = "github:nvim-telescope/telescope-symbols.nvim";
    telescope-ui-select-nvim.flake = false;
    telescope-ui-select-nvim.url = "github:nvim-telescope/telescope-ui-select.nvim";
    telescope-undo-nvim.flake = false;
    telescope-undo-nvim.url = "github:debugloop/telescope-undo.nvim";
    telescope-vimspector-nvim.flake = false;
    telescope-vimspector-nvim.url = "github:nvim-telescope/telescope-vimspector.nvim";
    telescope-z-nvim.flake = false;
    telescope-z-nvim.url = "github:nvim-telescope/telescope-z.nvim";
    texpresso-vim.flake = false;
    texpresso-vim.url = "github:let-def/texpresso.vim";
    todo-comments-nvim.flake = false;
    todo-comments-nvim.url = "github:folke/todo-comments.nvim";
    toggleterm-nvim.flake = false;
    toggleterm-nvim.url = "github:akinsho/toggleterm.nvim";
    tokyonight-nvim.flake = false;
    tokyonight-nvim.url = "github:folke/tokyonight.nvim";
    transparent-nvim.flake = false;
    transparent-nvim.url = "github:xiyaowong/transparent.nvim";
    trouble-nvim.flake = false;
    trouble-nvim.url = "github:folke/trouble.nvim";
    twilight-nvim.flake = false;
    twilight-nvim.url = "github:folke/twilight.nvim";
    typescript-tools-nvim.flake = false;
    typescript-tools-nvim.url = "github:pmizio/typescript-tools.nvim";
    typst-vim.flake = false;
    typst-vim.url = "github:kaarmu/typst.vim";
    undotree.flake = false;
    undotree.url = "github:mbbill/undotree";
    vim-airline.flake = false;
    vim-airline.url = "github:vim-airline/vim-airline";
    vim-bbye.flake = false;
    vim-bbye.url = "github:moll/vim-bbye";
    vim-commentary.flake = false;
    vim-commentary.url = "github:tpope/vim-commentary";
    vim-css-color.flake = false;
    vim-css-color.url = "github:ap/vim-css-color";
    vim-dadbod-ui.flake = false;
    vim-dadbod-ui.url = "github:kristijanhusak/vim-dadbod-ui";
    vim-devicons.flake = false;
    vim-devicons.url = "github:ryanoasis/vim-devicons";
    vim-easyescape.flake = false;
    vim-easyescape.url = "github:zhou13/vim-easyescape";
    vim-endwise.flake = false;
    vim-endwise.url = "github:tpope/vim-endwise";
    vim-floaterm.flake = false;
    vim-floaterm.url = "github:voldikss/vim-floaterm";
    vim-fugitive.flake = false;
    vim-fugitive.url = "github:tpope/vim-fugitive";
    vim-godot.flake = false;
    vim-godot.url = "github:habamax/vim-godot";
    vim-helm.flake = false;
    vim-helm.url = "github:towolf/vim-helm";
    vim-illuminate.flake = false;
    vim-illuminate.url = "github:RRethy/vim-illuminate";
    vim-import-cost.flake = false;
    vim-import-cost.url = "github:yardnsm/vim-import-cost";
    vim-julia-cell.flake = false;
    vim-julia-cell.url = "github:mroavi/vim-julia-cell";
    vim-ledger.flake = false;
    vim-ledger.url = "github:ledger/vim-ledger";
    vim-matchup.flake = false;
    vim-matchup.url = "github:andymass/vim-matchup";
    vim-nix.flake = false;
    vim-nix.url = "github:LnL7/vim-nix";
    vim-one.flake = false;
    vim-one.url = "github:rakr/vim-one";
    vim-prisma.flake = false;
    vim-prisma.url = "github:pantharshit00/vim-prisma";
    vim-repl.flake = false;
    vim-repl.url = "github:sillybun/vim-repl";
    vim-sandwich.flake = false;
    vim-sandwich.url = "github:machakann/vim-sandwich";
    vim-sleuth.flake = false;
    vim-sleuth.url = "github:tpope/vim-sleuth";
    vim-slime.flake = false;
    vim-slime.url = "github:jpalardy/vim-slime";
    vim-startify.flake = false;
    vim-startify.url = "github:mhinz/vim-startify";
    vim-surround.flake = false;
    vim-surround.url = "github:tpope/vim-surround";
    vim-tmux-navigator.flake = false;
    vim-tmux-navigator.url = "github:christoomey/vim-tmux-navigator";
    vim-vsnip-integ.flake = false;
    vim-vsnip-integ.url = "github:hrsh7th/vim-vsnip-integ";
    vim-vsnip.flake = false;
    vim-vsnip.url = "github:hrsh7th/vim-vsnip";
    vim-which-key.flake = false;
    vim-which-key.url = "github:liuchengxu/vim-which-key";
    vimtex.flake = false;
    vimtex.url = "github:lervag/vimtex";
    virt-column-nvim.flake = false;
    virt-column-nvim.url = "github:lukas-reineke/virt-column.nvim";
    vscode-nvim.flake = false;
    vscode-nvim.url = "github:Mofiqul/vscode.nvim";
    which-key-nvim.flake = false;
    which-key-nvim.url = "github:folke/which-key.nvim";
    wilder-nvim.flake = false;
    wilder-nvim.url = "github:gelguy/wilder.nvim";
    wtf-nvim.flake = false;
    wtf-nvim.url = "github:piersolenski/wtf.nvim";
    yanky-nvim.flake = false;
    yanky-nvim.url = "github:gbprod/yanky.nvim";
    zellij-nvim.flake = false;
    zellij-nvim.url = "github:Lilja/zellij.nvim";
    zen-mode-nvim.flake = false;
    zen-mode-nvim.url = "github:folke/zen-mode.nvim";
    zig-vim.flake = false;
    zig-vim.url = "github:ziglang/zig.vim";
    zk-nvim.flake = false;
    zk-nvim.url = "github:zk-org/zk-nvim";
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
      };
      flake = {
        overlays.default = final: prev: let
          plugins = builtins.filter (name:
            name
            != "self"
            && name != "nixpkgs"
            && name != "devshell"
            && name != "flake-parts"
            && name != "systems"
            && name != "hercules-ci-effects")
          (builtins.attrNames inputs);
        in {
          vimPlugins =
            prev.vimPlugins
            // builtins.listToAttrs
            (map (name: {
                inherit name;
                value = prev.vimPlugins.${name}.overrideAttrs {
                  src = inputs.${name};
                  version = "nightly";
                };
              })
              plugins);
        };
      };
    };
}
