""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   VIM PLUG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   GLOBAL EDITOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No vi
set nocompatible

" Colorscheme stuff
syntax enable
colorscheme dracula
set background=dark

" Support plugins and language indentation
filetype indent plugin on

" Fuzzy file style
set path+=**
set wildmenu

" Keep buffers available in the background
set hidden

" Encoding and line endings
set encoding=utf-8
set fileformat=dos

" Tabs... why?
set showtabline=0

" Line numbering
set number
set relativenumber
set numberwidth=3

" Highlight cursorline
set cursorline

" Search options
set hlsearch
set incsearch
set ignorecase

" Mouse compatibility
set mouse=a

" Splitting windows
set splitbelow
set splitright

" Leader key
let mapleader = ','

" Cycle open buffers
nnoremap <silent> <leader>b :bn<CR>

" Cycle open windows
nnoremap <silent> <leader>w <C-W>w

" Turn off search highlight
nnoremap <leader>h :nohl

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw settings
let g:netrw_banner=0       " get rid of annoying banner
let g:netrw_liststyle=3    " tree view

" airline settings
let g:airline#extensions#tabline#enabled = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   ALL FILE TYPES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   PYTHON FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PEP 8
au FileType python set tabstop=4
au FileType python set softtabstop=4
au FileType python set shiftwidth=4
au FileType python set expandtab
au FileType python set autoindent

" Autocomplete '' "" () [] {} in insert mode
au FileType python inoremap ( ()<Esc>i
au FileType python inoremap [ []<Esc>i
au FileType python inoremap { {}<Esc>i
au FileType python inoremap ' ''<Esc>i
au FileType python inoremap " ""<Esc>i
