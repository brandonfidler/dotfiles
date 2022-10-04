return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use('nvim-lua/popup.nvim')
  use('nvim-lua/plenary.nvim')

  use('nvim-telescope/telescope.nvim')
  use('nvim-telescope/telescope-fzy-native.nvim')
  use('neovim/nvim-lspconfig')

  use('pantharshit00/vim-prisma')
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
  use('nvim-lua/lsp_extensions.nvim')

  use('tpope/vim-fugitive')
  use('ThePrimeagen/git-worktree.nvim')
  use('ThePrimeagen/refactoring.nvim')

  use('ThePrimeagen/harpoon')
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  -- disabled because poor performance in big files
  -- use('nvim-treesitter/nvim-treesitter-context')

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
end)
