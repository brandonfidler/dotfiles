vim.g.theprimeagen_colorscheme = "catppuccin"
local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    vim.g.catppuccin_flavour = "mocha"
    vim.cmd [[colorscheme catppuccin]]
    vim.cmd [[:silent !tmux source-file ~/.tmux.conf]]
    vim.cmd [[:silent !kitty +kitten themes --reload-in=all Catppuccin-Mocha]]
    vim.cmd [[:silent !zsh -l]]
  end,
  set_light_mode = function()
    vim.g.catppuccin_flavour = "latte"
    vim.cmd [[colorscheme catppuccin]]
    vim.cmd [[:silent !tmux source-file ~/.tmux.conf]]
    vim.cmd [[:silent !kitty +kitten themes --reload-in=all Catppuccin-Latte]]
    vim.cmd [[:silent !zsh -l]]
  end,
})

auto_dark_mode.init()

require("catppuccin").setup({
  compile = {
    enabled = false,
    path = vim.fn.stdpath("cache") .. "/catppuccin",
  },
  transparent_background = false,
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    cmp = true,
    gitsigns = true,
    telescope = true,
    nvimtree = true,
    gitgutter = true,
    lsp_saga = true,
    harpoon = true,

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
  color_overrides = {},
  highlight_overrides = {},
})
