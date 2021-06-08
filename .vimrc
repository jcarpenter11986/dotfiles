" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' } " Dracula color scheme
Plug 'itchyny/lightline.vim' " A minimalist status line
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'ap/vim-buftabline'
call plug#end()

" Colorscheme
syntax enable
let g:dracula_colorterm = 0 " Get rid of weird gray background
colorscheme dracula
set laststatus=2
set noshowmode " Let the status line do the work
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

" Global setting
set splitbelow splitright " split windows more intuitively
set backspace=eol,start,indent " backspace works like other editors
set number relativenumber " rel numbering but with current line number visible
set clipboard=unnamed " use the system clipboard by default
set hidden " keep all buffers open in the background
set wildmenu wildmode=longest:full,full " better command line completion
set nowrap " don't wrap lines at end of screen
set expandtab " use tab key to automatically put in the necessary spaces
set hlsearch ignorecase incsearch smartcase " intuitive search features
set noswapfile
autocmd BufWritePre * %s/\s\+$//e " remove trailing whitespace on save

" Key remaps
nnoremap <c-j> :bp<cr>
nnoremap <c-k> :bn<cr>
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-p> :Files<cr>
nnoremap <c-o> :NERDTreeToggle<cr>
