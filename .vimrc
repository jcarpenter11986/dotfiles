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

" Editor behavior
set backspace=eol,start,indent " backspace works like other editors
set clipboard=unnamed " use the system clipboard by default
set hidden " keep all buffers open in the background
set nowrap " don't wrap lines at end of screen
set noswapfile
autocmd BufWritePre * %s/\s\+$//e " remove trailing whitespace on save

" Syntax and colors
syntax enable
colorscheme habamax
hi Normal guibg=NONE ctermbg=None
" ToDo: Tokyonight theme without a plugin manager

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

" Statusline
set laststatus=2
set noshowmode

" Mouse
set mouse=a
