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
map <C-n> :NERDTreeToggle<CR>

" 80 lines.
set colorcolumn=81
set textwidth=80

" Display whitespace, line numbers.
set list
set number

" Remove search highlighting with Ctrl+L.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Turn off wrap.
set nowrap

" Enable 'make' command.
set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ ..
set cinoptions+=g1
"let g:loaded_youcompleteme = 1
