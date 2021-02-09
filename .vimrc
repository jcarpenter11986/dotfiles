""" What do I want in Vim and can I do it without plugins?
" Colorscheme
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
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Colorscheme
syntax enable
colorscheme dracula
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Lets
let mapleader=" "
let python_highlight_all = 1
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
