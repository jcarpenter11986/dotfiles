"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   VIM BASE SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No vi
set nocompatible

" Support for plugins and language indentation
filetype indent plugin on

" Fuzzy file search for CWD
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

" Enable mouse
set mouse=a

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Netrw settings
let g:netrw_banner=0       " get rid of annoying banner
let g:netrw_liststyle=3    " tree view

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   DRACULA PRO COLORSCHEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The dracula colorscheme will need to be added to ~/.vim
" https://draculatheme.com/vim
" or use dracula_pro if you have it

packadd! dracula_pro
syntax enable
let g:dracula_colorterm=0
colorscheme dracula_pro

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   PYTHON SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable all Python syntax highlighting features
let python_highlight_all = 1

" Python friendly tabstops and indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=70
set expandtab
set autoindent
set fileformat=unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lightline will need to be added to ~/.vim 
" https://github.com/itchyny/lightline.vim

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'dracula_pro',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   SMART COMMENTING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Comment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py' || ext == 'cfg'
    silent s/^/\#/
  elseif ext == 'js'
    silent s:^:\/\/:g
  elseif ext == 'vim'
    silent s:^:\":g
  endif
endfunction

function! Uncomment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py' || ext == 'cfg'

    silent s/^\#//
  elseif ext == 'js'
    silent s:^\/\/::g
  elseif ext == 'vim'
    silent s:^\"::g
  endif
endfunction

map <C-a> :call Comment()<CR>
map <C-b> :call Uncomment()<CR>
