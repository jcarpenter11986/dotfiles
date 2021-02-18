"gInstall vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
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
set nobackup noswapfile " controversial, but I hate swap and backup files
set hidden " keep all buffers open in the background
set wildmenu wildmode=longest:full,full " better command line completion
set nowrap " don't wrap lines at end of screen
set expandtab " use tab key to automatically put in the necessary spaces
set hlsearch ignorecase incsearch smartcase " intuitive search features
let mapleader = " "
autocmd BufWritePre * %s/\s\+$//e " remove trailing whitespace on save

" navigate buffers
nnoremap <c-j> :bn<cr>
nnoremap <c-k> :bp<cr>

" Save work and remove highlights
nnoremap <leader><space> :nohl <bar> :w<cr>

" Python settings
autocmd FileType python
    \ nnoremap <buffer> <leader><cr>
    \ :w <bar> :terminal python3 "%"<cr>

" FZF settings
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fl :Lines<cr>
nnoremap <silent> <leader>fF :GFiles<cr>
nnoremap <silent> <leader>fL :BLines<cr>
nnoremap <silent> <leader>fC :Commits<cr>
nnoremap <silent> <leader>fg :Rg<cr>
