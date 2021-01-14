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
set scrolloff=8
set colorcolumn=80
set clipboard=unnamed
set mouse=a
set wildmenu
set wildmode=longest:full,full
set splitbelow splitright
set path+=**
set laststatus=2
set cursorline
set showmatch
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

" Colorscheme
packadd! dracula_pro
syntax enable
let g:dracula_colorterm = 0
colorscheme dracula_pro
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Lets
let mapleader=" "
let g:netrw_banner=0
let g:lightline = {
      \ 'colorscheme': 'dracula_pro',
      \ }
let python_highlight_all = 1
let g:is_mouse_enabled = 1

" Remaps
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>
noremap <silent> <Leader>m :call ToggleMouse()<CR>

" Autocommands
autocmd BufWritePre * %s/\s\+$//e
autocmd InsertEnter * norm zz

" Functions
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction
