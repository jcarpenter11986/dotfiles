"  ____  _                 _       __     _____ __  __
" / ___|(_)_ __ ___  _ __ | | ___  \ \   / /_ _|  \/  |
" \___ \| | '_ ` _ \| '_ \| |/ _ \  \ \ / / | || |\/| |
"  ___) | | | | | | | |_) | |  __/   \ V /  | || |  | |
" |____/|_|_| |_| |_| .__/|_|\___|    \_/  |___|_|  |_|
"                   |_|


" This is a very basic .vimrc for woring on remote machines
" with zero terminal editor configs

" Basic Vim settings
set nocompatible
filetype indent on

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' } " Dracula color scheme
Plug 'itchyny/lightline.vim' " A minimalist status line
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-buftabline'
call plug#end()

" Editor behavior
set backspace=eol,start,indent " backspace works like other editors
set clipboard=unnamed " use the system clipboard by default
set hidden " keep all buffers open in the background
set nowrap " don't wrap lines at end of screen
set noswapfile
autocmd BufWritePre * %s/\s\+$//e " remove trailing whitespace on save

" Syntax and colors
syntax enable
let g:dracula_colorterm = 0 " Get rid of weird gray background
colorscheme dracula
set laststatus=2
set noshowmode " Let the status line do the work
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
hi Normal guibg=NONE ctermbg=None

" Fuzzy finding
set path+=**
set wildmenu
set wildoptions=pum

" Line Numbers and Gutters
set number relativenumber

" Tabs and indents
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent

" Search
set hlsearch
set incsearch

" Cursor
set cursorline
if has("autocmd") "remember last cursor position
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Mouse
set mouse=a
