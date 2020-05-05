""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   VIM PLUG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged') " Call plugin start ---
"Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end() " Call plugin end ---

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   GLOBAL EDITOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No vi
set nocompatible

" Colorscheme stuff
packadd! dracula_pro
syntax enable
colorscheme dracula_pro
highlight Normal ctermbg=None

" Support for plugins and language indentation
filetype indent plugin on

" Fuzzy file search
" Make sure your CWD is the root of your project
set path+=**
set wildmenu
set wildmode=longest:full,full

" Encoding
set encoding=utf-8

" Line numbering
set number
set relativenumber

" Highlight cursorline
set cursorline

" Search options
set hlsearch
set incsearch
set ignorecase

" Match braces
set showmatch

" Splitting windows
set splitbelow
set splitright

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" netrw
let g:netrw_banner=0       " get rid of annoying banner
let g:netrw_liststyle=3    " tree view

" enable all Python syntax highlighting features
let python_highlight_all = 1

" tabstops and indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=70
set expandtab
set autoindent
set fileformat=unix
