""" What do I want in Vim and can I do it without plugins?  " Colorscheme
" Syntax highlighting
" Status line
" Fuzzy find
" Autocomplete or linting of some sort
" Goto definition
" Git integration

filetype plugin on

" Sane settings
set nocompatible
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
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
set noruler noshowmode
set scrolloff=8
set colorcolumn=80
set clipboard=unnamed
set wildmenu
set wildmode=longest:full,full
set splitbelow splitright
set laststatus=2
set cursorline
set showmatch
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
if !has('gui_running')
      set t_Co=256
  endif

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Colorscheme
packadd! dracula_pro
syntax enable
let g:dracula_colorterm = 0
colorscheme dracula_pro
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Lets
let mapleader=" "
let python_highlight_all = 1
let g:lightline = {
      \ 'colorscheme': 'dracula_pro',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
let $FZF_DEFAULT_COMMAND = "fd -t f -E \'*.{class,dll,exe,jar,o,pyc,so,war}\' . $(scmroot " . expand('%:p:h') . ")"

" Remaps
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fc :Commits<CR>
nnoremap <silent> <leader>fC :BCommits<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :GFiles<CR>
nnoremap <silent> <leader>fG :GFiles?<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fl :Lines<Space>
nnoremap <silent> <leader>fr :Rg<Space>

" Autocommands
autocmd BufWritePre * %s/\s\+$//e
autocmd InsertEnter * norm zz

" Functions

" Source the Coc settings file
source ~/dotfiles/coc.vim
