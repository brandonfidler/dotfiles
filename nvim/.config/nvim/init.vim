set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes

set cmdheight=2

set updatetime=50

set shortmess+=c

call plug#begin('~/.vim/plugged')
"telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
"Snippets
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-lua/completion-nvim'
"git
Plug 'tpope/vim-fugitive'
"status bar
Plug 'hoob3rt/lualine.nvim'

Plug 'stsewd/fzf-checkout.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf',{ 'do': {->fzf#install()}}
"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
"colorscheme
Plug 'gruvbox-community/gruvbox'
call plug#end()

let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8 }}
let $FZF_DEFAULT_OPTS='--reverse'

colorscheme gruvbox
set background=dark

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep for > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

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
inoremap <C-j> :m .+1<CR>==
inoremap <C-k> :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

nnoremap <leader>x :!chmod +x %<CR>
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
nnoremap <leader>K :cnext<CR>
nnoremap <leader>J :cprev<CR>

nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>gc :GBranches checkout<CR>
nnoremap <leader>gn :GBranches create<CR>
nnoremap <leader>gf :Git fetch<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

"it worked

"a change


