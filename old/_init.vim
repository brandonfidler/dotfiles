" hello front end masters
set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*


call plug#begin('~/.vim/plugged')
"telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

" TODO learn about diagram maker
" Plug 'jbyuki/venn.nvim'

" Language Client
    Plug 'neovim/nvim-lspconfig'
    Plug 'pantharshit00/vim-prisma'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'onsails/lspkind-nvim'
    Plug 'nvim-lua/lsp_extensions.nvim'
    Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

"git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'ThePrimeagen/git-worktree.nvim'
    Plug 'ThePrimeagen/refactoring.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'github/copilot.vim'

"status bar
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons' " lua
    Plug 'ryanoasis/vim-devicons'

"fzf
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf',{ 'do': {->fzf#install()}}

"colorscheme
    Plug 'gruvbox-community/gruvbox'

"Prettier
    Plug 'sbdchd/neoformat'

"tpope plugins
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'rhysd/vim-grammarous'
    Plug 'tomlion/vim-solidity'
    Plug 'onsails/lspkind-nvim'
    Plug 'ThePrimeagen/harpoon'
    Plug 'junegunn/goyo.vim'
"debugger
    Plug 'mfussenegger/nvim-dap'
    Plug 'Pocco81/DAPInstall.nvim'
    Plug 'nvim-telescope/telescope-dap.nvim'
    Plug 'theHamsta/nvim-dap-virtual-text'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'puremourning/vimspector'
"markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()


let mapleader = " "
"telescope mapping
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep for > ")})<CR>
nnoremap <C-p> :lua require'telescope.builtin'.git_files(require('telescope.themes').get_dropdown())<cr>
nnoremap <leader>pf :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

nnoremap <expr> k (v:count > 5 ? "m'" .v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" .v:count : "") . 'j'


vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>x :!chmod +x %<CR>
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
nnoremap <leader>k :cnext<CR>
nnoremap <leader>j :cprev<CR>

nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

" greatest remap ever
xnoremap <leader>p "_dP

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>F :Telescope live_grep<CR>
nnoremap <leader>; :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap vr gd[{V%::s/<C-R>///gc<left><left><left>
nnoremap vR gD:%s/<C-R>///gc<left><left><left>
nnoremap <C-t> :Rex<CR>

nnoremap <leader>TSK :TSHighlightCapturesUnderCursor<CR>
nnoremap <leader>TSP :TSPlaygroundToggle<CR>
nmap <leader>tt <Plug>PlenaryTestFile

lua require("theprimeagen")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

lua <<EOF
    require("telescope").load_extension("git_worktree")
    require("telescope").load_extension("refactoring")


    require("telescope").load_extension('harpoon')
    require('lualine').setup()


    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    }
EOF


lua << EOF


    function ContextSetup(show_all_context)
        require("treesitter-context").setup({
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            throttle = true, -- Throttles plugin updates (may improve performance)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            show_all_context = show_all_context,
            patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                -- For all filetypes
                -- Note that setting an entry here replaces all other patterns for this entry.
                -- By setting the 'default' entry below, you can control which nodes you want to
                -- appear in the context window.
                default = {
                    "function",
                    "method",
                    "for",
                    "while",
                    "if",
                    "switch",
                    "case",
                },

                rust = {
                    "loop_expression",
                    "impl_item",
                },

                typescript = {
                    "class_declaration",
                    "abstract_class_declaration",
                    "else_clause",
                },
            },
        })
    end

    NnoremapGlobal("<leader>cf", "<cmd>lua ContextSetup(true)<CR>")
    NnoremapGlobal("<leader>cp", "<cmd>lua ContextSetup(false)<CR>")
EOF

autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll

set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre *.lua Neoformat
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
