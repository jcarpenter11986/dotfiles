""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   VIM PLUG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged') " Call plugin start ---
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end() " Call plugin end ---

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   GLOBAL EDITOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No vi
set nocompatible

" Colorscheme stuff
syntax enable
colorscheme dracula
set background=dark

" Support for plugins and language indentation
filetype indent plugin on

" Fuzzy file search
" Make sure your CWD is the root of your project
set path+=**
set wildmenu
set wildmode=longest:full,full

" Keep buffers available in the background
set hidden

" Encoding
set encoding=utf-8

" Tabs... why?
set showtabline=0

" Line numbering
set number
set relativenumber
set numberwidth=3

" Highlight cursorline
set cursorline

" Search options
set hlsearch
set incsearch
set ignorecase

" Match braces
set showmatch

" Mouse compatibility
set mouse=a

" Leader key
let mapleader = ' '

" Splitting windows
set splitbelow
set splitright

" Cycle open buffers
nnoremap <leader>j :bn<cr>
nnoremap <leader>k :bp<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Turn off search highlight
nnoremap <silent> <leader><space> :nohl<cr>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" netrw
let g:netrw_banner=0       " get rid of annoying banner
let g:netrw_liststyle=3    " tree view
nnoremap <silent> <leader>e :Explore<CR>

" airline
let g:airline#extensions#tabline#enabled = 1 " display open buffers at the top

" fzf
let g:fzf_layout = {'window':'15new'}
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fc :Commits<CR>
nnoremap <silent> <leader>fC :BCommits<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :GFiles<CR>
nnoremap <silent> <leader>fG :GFiles?<CR>
nnoremap <silent> <leader>fh :History:<CR>
nnoremap <silent> <leader>fH :History<CR>
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>fL :BLines<CR>
nnoremap <silent> <leader>fr :Rg<CR>
let $FZF_DEFAULT_COMMAND = "fd -t f -E \'*.{class,dll,exe,jar,o,pyc,so,war}\'"

" fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gp :Gpush<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   ALL FILE TYPES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   PYTHON FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable all Python syntax highlighting features
let python_highlight_all = 1

" PEP 8
au FileType python set tabstop=4
au FileType python set softtabstop=4
au FileType python set shiftwidth=4
au FileType python set textwidth=70
au FileType python set expandtab
au FileType python set autoindent
au FileType python set fileformat=unix

" Autocomplete '' "" () [] {} in insert mode
au FileType python inoremap ( ()<Esc>i
au FileType python inoremap [ []<Esc>i
au FileType python inoremap { {}<Esc>i
au FileType python inoremap ' ''<Esc>i
au FileType python inoremap " ""<Esc>i

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   JS HTML CSS FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.js,*.html,*.css set tabstop=2
au BufNewFile,BufRead *.js,*.html,*.css set softtabstop=2
au BufNewFile,BufRead *.js,*.html,*.css set shiftwidth=2
