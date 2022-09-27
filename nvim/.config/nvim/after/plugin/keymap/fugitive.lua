local Remap = require("theprimeagen.keymap")
local nmap = Remap.nmap

-- nmap <leader>gj :diffget //3<CR>
-- nmap <leader>gf :diffget //2<CR>
-- nmap <leader>gs :G<CR>
nmap("<leader>gj", ":diffget //3<CR>")
nmap("<leader>gf", ":diffget //2<CR>")
nmap("<leader>gs", ":G<CR>")

-- nnoremap("<leader>hm", function() require("harpoon.mark").add_file() end, silent)
-- nnoremap("<leader>hf", function() require("harpoon.ui").toggle_quick_menu() end, silent)
-- nnoremap("<leader>hu", function() require("harpoon.cmd-ui").toggle_quick_menu() end, silent)
