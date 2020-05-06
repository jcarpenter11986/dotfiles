
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   GLOBAL EDITOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No vi
set nocompatible

" Colorscheme stuff
packadd! dracula_pro
syntax enable
colorscheme dracula_pro
highlight Normal ctermbg=None

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

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Netrw
let g:netrw_banner=0       " get rid of annoying banner
let g:netrw_liststyle=3    " tree view

" Enable all Python syntax highlighting features
let python_highlight_all = 1

" Tabstops and indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=70
set expandtab
set autoindent
set fileformat=unix

" Statusline config
function! GitBranch()
      return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
      return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
  endfunction

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
