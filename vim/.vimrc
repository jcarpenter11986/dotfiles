" Check for and install Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

" Different ways to load and control plugins
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'



" ===LOAD PLUGINS===
call plug#begin('~/.vim/plugged') " Call plugin start ---

" Dracula colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }

" CtrlP fuzzy file finding
Plug 'ctrlpvim/ctrlp.vim'

" NERDTree Tree view of files
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }

" Airline status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fugitive git wrapper
Plug 'tpope/vim-fugitive' 

" Jedi completion for Python
Plug 'davidhalter/jedi-vim'

call plug#end() " Call plugin end ---



" ===PLUGIN SETTINGS===

" CtrlP
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Airline
let g:airline_theme='kolor'
let g:airline#extensions#tabline#enabled = 1


" ===GLOBAL EDITOR SETTINGS===

" Necessary for some plugins
set nocompatible
set hidden
set encoding=utf-8
set showtabline=0

" Line numbering
set number
set relativenumber
set numberwidth=3

" Search options
set hlsearch
set ignorecase

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Mouse compatibility
set mouse=a

" Splitting windows
set splitbelow
set splitright



" ===VIM KEYBINDINGS===

" Leader key
let mapleader = ' '

" Moving between window panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Switching buffers
nnoremap <leader>j :bn<CR>
nnoremap <leader>k :bp<CR>

" Autocomplete '' "" () [] {} in insert mode
inoremap () ()<Esc>i
inoremap [] []<Esc>i
inoremap {} {}<Esc>i
inoremap '' ''<Esc>i
inoremap "" ""<Esc>i
