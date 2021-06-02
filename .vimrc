" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Activate Dracula Pro
packadd! dracula_pro

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'ervandew/supertab'
Plug '/usr/local/opt/fzf'
call plug#end()

" Colorscheme
syntax enable
let g:dracula_colorterm = 0
colorscheme dracula_pro
set laststatus=2
set noshowmode
if !has('gui_running')
  set t_Co=256
endif
let g:lightline =  {
  \ 'colorscheme': 'dracula_pro',
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
autocmd BufWritePre * %s/\s\+$//e " remove trailing whitespace on save

" Key remaps
nnoremap <c-j> :bp<cr>
nnoremap <c-k> :bn<cr>
