" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mechatroner/rainbow_csv'
call plug#end()

" Colorscheme
if !empty(glob('~/.vim/plugged/gruvbox/'))
  colorscheme gruvbox
  set background=dark
endif

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
let mapleader = " "
autocmd BufWritePre * %s/\s\+$//e " remove trailing whitespace on save

" Python
augroup python
  autocmd FileType python
      \ nnoremap <buffer> <leader><cr>
      \ :w <bar> :terminal python3 "%"<cr> " Run current python script
augroup END

" CSV
augroup csv
  autocmd FileType csv nnoremap <leader><cr> :w <bar> !clear && mlr --icsv --opprint --barred cat "%"<cr>
augroup END

" Key remaps
nnoremap <c-p> :Files<cr>
nnoremap <c-j> :bp<cr>
nnoremap <c-k> :bn<cr>
