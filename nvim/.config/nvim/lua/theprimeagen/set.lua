vim.g.netrw_banner = 0 -- Hide the banner
vim.g.netrw_sort_sequence = "[/]$,.(.*),.*().*,./$,~=*$,*,.h$,.c$,.cpp$,.o$,.obj$,.info$,.swp$,.bak$,~$"
vim.g.netrw_browser_split = 0
vim.g.netrw_winsize = 25

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
-- vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
-- vim.opt.shortmess:append("c")

vim.opt.colorcolumn = "80"

vim.opt.laststatus = 3

vim.g.mapleader = " "

vim.opt.mmp = 2000

vim.opt.foldmarker = "{{{,}}}"

-- Set the filetype plugin and indent on in Lua
vim.cmd([[filetype plugin indent on]])

-- make this work in lua file
-- set rtp+=/opt/homebrew/opt/fzf
vim.opt.rtp:append("/opt/homebrew/opt/fzf")
