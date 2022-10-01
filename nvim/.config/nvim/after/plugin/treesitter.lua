-- require'nvim-treesitter.configs'.setup {
--     ensure_installed = "all",
--     sync_install = false,

--     highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = true,
--     },
-- }
local function ts_disable(_, bufnr)
    return vim.api.nvim_buf_line_count(bufnr) > 5000
end

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        disable = function(lang, bufnr)
            return lang == "cmake" or ts_disable(lang, bufnr)
        end,
    },
}
