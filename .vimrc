" Plugins
packadd! dracula_pro

" Colorscheme
syntax enable
let g:dracula_colorterm=0
colorscheme dracula_pro
set laststatus=2
set noshowmode " Let the status line do the work
let g:lightline = {
  \ 'colorscheme': 'dracula_pro',
  \}

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
set mouse=a
autocmd BufWritePre * %s/\s\+$//e " remove trailing whitespace on save

" Key remaps
nnoremap <c-j> :bp<cr>
nnoremap <c-k> :bn<cr>
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-p> :FZF<CR>

" FZF
set rtp+=/usr/local/opt/fzf
" - Popup window (anchored to the bottom of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
