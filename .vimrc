" Install vim-plug if not found
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
Plug 'airblade/vim-gitgutter'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
autocmd BufWritePre * %s/\s\+$//e " remove trailing whitespace on save
let mapleader=" " " map leader key to spacebar

" Global keymap
    " navigate and manage windows
    nnoremap <leader>h :wincmd h<cr>
    nnoremap <leader>l :wincmd l<cr>
    nnoremap <leader>j :wincmd j<cr>
    nnoremap <leader>k :wincmd k<cr>

    " navigate and manage buffers
    nnoremap <leader>] :bn<cr>
    nnoremap <leader>[ :bp<cr>
    nnoremap <leader><backspace> :bd<cr>

    " Save work and remove highlights
    nnoremap <leader><space> :nohl <bar> :w<cr>

" Python specific settings
autocmd FileType python " save and run code in another window
    \ nnoremap <buffer> <leader><cr>
    \ :w <bar> :terminal python3 "%"<cr>

" Source the Coc settings file
"source ~/dotfiles/coc.vim

" FZF settings
"let $FZF_DEFAULT_COMMAND = "fd -t f -E \'*.{class,dll,exe,jar,o,pyc,so,war}\' . $(scmroot " . expand('%:p:h') . ")"
"nnoremap <silent> <leader>fb :Buffers<CR>
"nnoremap <silent> <leader>fc :Commits<CR>
"nnoremap <silent> <leader>fC :Commands<CR>
"nnoremap <silent> <leader>ff :Files<CR>
"nnoremap <silent> <leader>fg :GFiles<CR>
"nnoremap <silent> <leader>fG :GFiles?<CR>
"nnoremap <silent> <leader>fh :History<CR>
"nnoremap <silent> <leader>fl :Lines<Space>
"nnoremap <silent> <leader>fr :Rg<Space>
