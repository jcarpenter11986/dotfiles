filetype plugin on
filetype indent on

" Sane settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set smartindent
set number relativenumber
set nowrap
set noswapfile
set incsearch
set nohlsearch
set smartcase
set ignorecase
set hidden
set noruler
set noshowmode
set clipboard=unnamed
set wildmenu
set wildmode=longest:full,full
set laststatus=2
set cursorline
set showmatch
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]
set fileformat=unix
set encoding=utf-8

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Colorscheme
syntax enable
colorscheme gruvbox
set background=dark

" Lets
let mapleader=" "
let python_highlight_all = 1
let $FZF_DEFAULT_COMMAND = "fd -t f -E \'*.{class,dll,exe,jar,o,pyc,so,war}\' . $(scmroot " . expand('%:p:h') . ")"

" Remaps
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fc :Commits<CR>
nnoremap <silent> <leader>fC :Commands<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :GFiles<CR>
nnoremap <silent> <leader>fG :GFiles?<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fl :Lines<Space>
nnoremap <silent> <leader>fr :Rg<Space>

" Autocommands
autocmd BufWritePre * %s/\s\+$//e " Gets rid of trailing whitespace

" Functions

" Source the Coc settings file
source ~/dotfiles/coc.vim
