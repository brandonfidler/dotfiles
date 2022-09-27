return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("junegunn/vim-easy-align")
    use('nvim-lua/popup.nvim')
    use('nvim-lua/plenary.nvim')
    use('nvim-telescope/telescope.nvim')
    use('nvim-telescope/telescope-fzy-native.nvim')
    use{'sonph/onehalf'}

    use('neovim/nvim-lspconfig')
    use('pantharshit00/vim-prisma')
    use('rafamadriz/friendly-snippets')
    use('L3MON4D3/LuaSnip')
    use('hrsh7th/cmp-nvim-lua')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/nvim-cmp')
    use('onsails/lspkind-nvim')
    use('nvim-lua/lsp_extensions.nvim')

    use('tpope/vim-fugitive')
    use('tpope/vim-rhubarb')
    use('junegunn/gv.vim')
    use('airblade/vim-gitgutter')
    use('ThePrimeagen/git-worktree.nvim')
    use('ThePrimeagen/refactoring.nvim')
    use('ThePrimeagen/harpoon')

    use('nvim-treesitter/nvim-treesitter', {run =':TSUpdate'})
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use('github/copilot.vim')

    use (
      'nvim-lualine/lualine.nvim',
      {opt = true }
    )

    use('kyazdani42/nvim-web-devicons')
    use('ryanoasis/vim-devicons')

    --look into this one
    use('stsewd/fzf-checkout.vim')

    use('junegunn/fzf.vim')
    use('junegunn/fzf')

    use('gruvbox-community/gruvbox')

    use('sbdchd/neoformat')

    use('tpope/vim-commentary')
    use('tpope/vim-surround')
    use('tpope/vim-repeat')
    use('rhysd/vim-grammarous')
    use('tomlion/vim-solidity')

    use('folke/tokyonight.nvim')

    use("glepnir/lspsaga.nvim")

    --markdown stuff
    use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
end)
