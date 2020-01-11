" ===GLOBAL EDITOR SETTINGS===
set nocompatible
syntax enable
colorscheme delek
filetype plugin on
set path+=**
set wildmenu
set hidden
set encoding=utf-8
set showtabline=0

" Line numbering
set number
set relativenumber
set numberwidth=3

" Search options
set hlsearch
set ignorecase

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Mouse compatibility
set mouse=a

" Splitting windows
set splitbelow
set splitright

" Get rid of Netrw banner
let g:netrw_banner=0

" ===KEYBINDINGS===
" Leader key
let mapleader = ' '

" Cycle open buffers
nnoremap <silent> <leader>b :bn<CR>

" Cycle open windows
nnoremap <silent> <leader>w <C-W>w

" Autocomplete '' "" () [] {} in insert mode
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap '' ''<Esc>i
inoremap "" ""<Esc>i

" ===AUTO COMMANDS===
" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
