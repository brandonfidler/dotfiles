require("theprimeagen.set")
require("theprimeagen.packer")
require("theprimeagen.statusline")
require("theprimeagen.lsp_with_nick")

local augroup = vim.api.nvim_create_augroup
ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
--     group = ThePrimeagenGroup,
--     pattern = "*.rs",
--     callback = function()
--         require("lsp_extensions").inlay_hints{}
--     end
-- })

-- autocmd({"BufWritePre"}, {
--     group = ThePrimeagenGroup,
--     pattern = "*",
--     command = "%s/\\s\\+$//e",
-- })

-- when saving run Neoformat
-- autocmd({"BufWritePre"}, {
--     group = ThePrimeagenGroup,
--     pattern = "*",
--     command = "Neoformat",
-- })


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.loaded_perl_provider = 0
