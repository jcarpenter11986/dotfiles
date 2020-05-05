""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   VIM PLUG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged') " Call plugin start ---
Plug 'vim-airline/vim-airline'
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
set background=dark

" Support for plugins and language indentation
filetype indent plugin on

" Fuzzy file search
" Make sure your CWD is the root of your project
set path+=**
set wildmenu
set wildmode=longest:full,full

" Give more space for displaying messages.
set cmdheight=2

" Keep buffers available in the background
set hidden

" Encoding
set encoding=utf-8

" Tabs... why?
set showtabline=0

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

" Mouse compatibility
set mouse=a

" Leader key
let mapleader = ' '

" Splitting windows
set splitbelow
set splitright

" Turn off search highlight
nnoremap <silent> <leader><space> :nohl<cr>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" netrw
let g:netrw_banner=0       " get rid of annoying banner
let g:netrw_liststyle=3    " tree view

" airline
let g:airline#extensions#tabline#enabled = 1 " display open buffers at the top

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   PYTHON FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable all Python syntax highlighting features
let python_highlight_all = 1

" PEP 8
au FileType python set tabstop=4
au FileType python set softtabstop=4
au FileType python set shiftwidth=4
au FileType python set textwidth=70
au FileType python set expandtab
au FileType python set autoindent
au FileType python set fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   JS HTML CSS FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.js,*.html,*.css set tabstop=4
au BufNewFile,BufRead *.js,*.html,*.css set softtabstop=4
au BufNewFile,BufRead *.js,*.html,*.css set shiftwidth=4

python import sys; sys.path.append("/usr/local/lib/python3.7/site-packages")
