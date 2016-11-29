" Minimal.
execute pathogen#infect()
syntax on
filetype plugin indent on

" Tab settings.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
let g:tex_indent_brace=0

" Colorscheme.
colorscheme atom-dark-256

" Nerdtree with Ctrl-N.
map <C-n> :NERDTreeTabsToggle<CR>

" Nerdtree options.
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1

" 80 lines.
set colorcolumn=81
set textwidth=80

" Display whitespace, line numbers.
set list
set number

" Remove search highlighting with Ctrl+I.
nnoremap <silent> <C-i> :nohl<CR><C-i>

" Turn off wrap.
set nowrap

" Enable 'make' command.
set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ ..
set cinoptions+=g1

" Copy from/to system clipboard (needs xclip).
" (https://github.com/neovim/neovim/issues/583)
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

" Open new split panes to right and bottom (instead of left and top).
set splitbelow
set splitright

" Remap ctrl-[hjkl] to navigate splits.
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Vim Airline Theme
let g:airline_theme='jellybeans'
