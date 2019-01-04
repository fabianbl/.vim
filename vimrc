" Minimal.
call plug#begin('~/.vim/bundle')
Plug 'Chiel92/vim-autoformat'
Plug 'Valloric/YouCompleteMe'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'drmikehenry/vim-headerguard'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'taketwo/vim-ros'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" syntax on
filetype plugin indent on

" Tab settings.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
let g:tex_indent_brace=0
autocmd FileType python setlocal tabstop=2 shiftwidth=2

" Colorscheme.
if has("nvim")
  colorscheme atom-dark-256
  syntax on
  set list
else
  colorscheme atom-dark
  syntax on
  highlight ColorColumn ctermbg=7
endif

" Nerdtree with Ctrl-N.
map <C-n> :NERDTreeTabsToggle<CR>

" Nerdtree options.
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1

" 80 lines.
set colorcolumn=81
" set textwidth=80

" Display line numbers.
set number

" Remove search highlighting with Ctrl+I.
nnoremap <silent> <C-i> :nohl<CR><C-i>

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

" Interpret ROS launch files as XML.
autocmd BufRead,BufNewFile *.launch setfiletype xml

" Fixing some strange characters (https://github.com/neovim/neovim/issues/5990).
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
:set guicursor=

" Nerdcommenter options.
let g:NERDSpaceDelims = 1

" Options for vim-autoformat.
noremap <F3> :Autoformat<CR>
let g:formatdef_clangformat='"clang-format -style=file -fallback-style=google"'
let g:formatters_python=['yapf']
let g:formatter_yapf_style='google'

" HeaderGuards
function! g:HeaderguardName()
  let project_name = expand('%:p:gs@.*include/\(.*\)/.*@\1@g')
  let project_name = substitute(project_name, '[^0-9a-zA-Z_]', '_', 'g')
  let project_name = toupper(project_name)
  let file_name = toupper(expand('%:t:gs/[^0-9a-zA-Z_]/_/g'))
  return project_name . "_" . file_name . "_"
endfunction

function! g:HeaderguardLine3()
  return "#endif  // " . g:HeaderguardName() . ""
endfunction
