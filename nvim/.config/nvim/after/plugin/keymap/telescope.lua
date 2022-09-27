local Remap = require("theprimeagen.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>ps", function()
    -- require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
    -- make case sensitive
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > "), case_sensitive = true })
end)

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
