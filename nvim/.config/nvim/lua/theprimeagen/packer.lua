return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("VonHeikemen/lsp-zero.nvim")

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use('nvim-lua/popup.nvim')
  use('nvim-lua/plenary.nvim')
  use('heavenshell/vim-jsdoc')
  use('ellisonleao/gruvbox.nvim')
  use('folke/tokyonight.nvim')

  use('nvim-telescope/telescope-fzy-native.nvim')
  use('neovim/nvim-lspconfig')

  use('rafamadriz/friendly-snippets')
  use('L3MON4D3/LuaSnip')

  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lua')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-nvim-lsp-signature-help')

  use('hrsh7th/cmp-cmdline')

  use('onsails/lspkind-nvim')

  use('tpope/vim-fugitive')
  use('ThePrimeagen/git-worktree.nvim')
  use('ThePrimeagen/refactoring.nvim')

  use('ThePrimeagen/harpoon')
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('tpope/vim-surround')
  use('BurntSushi/ripgrep')

  -- disabled because poor performance in big files
  use('nvim-treesitter/nvim-treesitter-context')

  use('github/copilot.vim')
  use(
    'nvim-lualine/lualine.nvim',
    { opt = true }
  )
  use('kyazdani42/nvim-web-devicons')

  use('ryanoasis/vim-devicons')
  use('junegunn/fzf.vim')
  use('junegunn/fzf')

  use('tpope/vim-commentary')
  use('tpope/vim-repeat')

  use("glepnir/lspsaga.nvim")
  use('airblade/vim-gitgutter')

  use('Hoffs/omnisharp-extended-lsp.nvim')
  use { "catppuccin/nvim", as = "catppuccin" }
  use("f-person/auto-dark-mode.nvim")

  use('lvimuser/lsp-inlayhints.nvim')

  use('simrat39/symbols-outline.nvim')

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end

  }


  use({
    "luukvbaal/statuscol.nvim",
    config = function() require("statuscol").setup({ setopt = true }) end
  })

  use('Quramy/vim-js-pretty-template')

  use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
  use({ 'vim-test/vim-test' })
end)
