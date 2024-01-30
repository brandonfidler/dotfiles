local Remap = require("theprimeagen.keymap")
local nmap = Remap.nmap

-- nmap <silent> <leader>t :TestNearest<CR>
-- nmap <silent> <leader>T :TestFile<CR>
-- nmap <silent> <leader>a :TestSuite<CR>
-- nmap <silent> <leader>l :TestLast<CR>
-- nmap <silent> <leader>g :TestVisit<CR>

nmap("<leader>t", ":TestNearest //3<CR>")
nmap("<leader>T", ":TestFile //3<CR>")
nmap("<leader>a", ":TestSuite //3<CR>")
nmap("<leader>l", ":TestLast //3<CR>")
nmap("<leader>g", ":TestVisit //3<CR>")

--write => let g:test#strategy = "neovim" in lua
vim.g["test#strategy"] = "neovim"
vim.g["test#javascript#runner"] = "vitest"
