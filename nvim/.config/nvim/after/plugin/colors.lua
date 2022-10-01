vim.g.theprimeagen_colorscheme = "catppuccin"
local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
    vim.g.catppuccin_flavour = "mocha"
    vim.cmd [[colorscheme catppuccin]]
    vim.cmd [[!kitty +kitten themes --reload-in=all Catppuccin-Mocha]]
    vim.cmd [[!zsh -l]]
    vim.cmd [[!tmux source-file ~/.tmux.conf]]
	end,
	set_light_mode = function()
    vim.g.catppuccin_flavour = "latte"
    vim.cmd [[colorscheme catppuccin]]
    vim.cmd [[!kitty +kitten themes --reload-in=all Catppuccin-Latte]]
    vim.cmd [[!zsh -l]]
    vim.cmd [[!tmux source-file ~/.tmux.conf]]
	end,
})
auto_dark_mode.init()



require("catppuccin").setup({
	compile = {
		enabled = false,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	integrations = {
		treesitter = true,
		cmp = true,
		gitsigns = true,
		telescope = true,
		nvimtree = true,
    gitgutter = true,
    lsp_saga = true,

    -- special integrations
  native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
  },
})
