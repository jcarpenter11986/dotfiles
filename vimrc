" Plugins
call plug#begin()
Plug 'dracula/vim',{'as':'dracula'}
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-buftabline'
Plug 'vim-scripts/AutoComplPop'
call plug#end()

" No vi
set nocompatible

" Support for plugins and language indentation
filetype plugin indent on

" Fuzzy file search for CWD
set path+=**
set wildmenu
set wildmode=longest:full,full

" Line numbering
set number
set relativenumber

" Buffers
set hidden

" Highlight cursorline
set cursorline

" Search options
set hlsearch
set incsearch
set ignorecase

" Match braces
set showmatch

" Configure backspace so it acts as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

" Colorscheme and status line
" https://draculatheme.com/vim
syntax enable
colorscheme dracula
set laststatus=2
set noshowmode
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

" Enable all Python syntax highlighting features
let python_highlight_all = 1

" Python friendly tabstops and indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" indent/unindent with tab/shift-tab
nmap <Tab> >>
imap <S-Tab> <Esc><<i
nmap <S-tab> <<

" mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
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

" copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Competion
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

" ToDo
