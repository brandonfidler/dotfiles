local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
  set_dark_mode = function()
    vim.cmd [[colorscheme tokyonight-night]]
    vim.o.background = "dark"
    vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
    vim.cmd [[hi VertSplit guibg=NONE ctermbg=NONE]]
    vim.cmd [[hi GitGutterAdd guibg=NONE ctermbg=NONE]]
    vim.cmd [[hi GitGutterChange guibg=NONE ctermbg=NONE]]
    vim.cmd [[hi GitGutterDelete guibg=NONE ctermbg=NONE]]
  end,
  set_light_mode = function()
    vim.cmd [[colorscheme tokyonight-day]]
    vim.o.background = "light"
    vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
    vim.cmd [[hi VertSplit guibg=NONE ctermbg=NONE]]
    vim.cmd [[hi GitGutterAdd guibg=NONE ctermbg=NONE]]
    vim.cmd [[hi GitGutterChange guibg=NONE ctermbg=NONE]]
    vim.cmd [[hi GitGutterDelete guibg=NONE ctermbg=NONE]]
  end,
})
