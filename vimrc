"     _ _            __     ___
"    | (_)_ __ ___   \ \   / (_)_ __ ___  _ __ ___
" _  | | | '_ ` _ \   \ \ / /| | '_ ` _ \| '__/ __|
"| |_| | | | | | | |   \ V / | | | | | | | | | (__
" \___/|_|_| |_| |_|    \_/  |_|_| |_| |_|_|  \___|
"

" My vimrc config for when I don't have neovim.

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
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim' " A minimalist status line
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
" Plug 'ap/vim-buftabline'
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
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 0
let g:tokyonight_transparent_background = 1
let g:tokyonight_disable_italic_comment = 1
let g:lightline = {'colorscheme' : 'tokyonight'}
colorscheme tokyonight
set laststatus=2
set noshowmode " Let the status line do the work

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
