" ===VIM PLUG===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged') " Call plugin start ---
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'jreybert/vimagit'
call plug#end() " Call plugin end ---

" ===GLOBAL EDITOR SETTINGS===
set nocompatible
syntax enable
colorscheme dracula
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

" Highlight cursorline
set cursorline

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

" netrw settings
let g:netrw_banner=0       " get rid of annoying banner
let g:netrw_liststyle=3    " tree view

" airline settings
let g:airline#extensions#tabline#enabled = 1


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
