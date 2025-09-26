" Fabian's lean Vim config.

" --- Plugin management ---------------------------------------------------
call plug#begin('~/.vim/bundle')
Plug 'Chiel92/vim-autoformat'        " one-key formatting with clang-format/yapf
Plug 'Xuyuanp/nerdtree-git-plugin'   " git status badges inside NERDTree
Plug 'airblade/vim-gitgutter'        " inline diff signs for quick review
Plug 'jistr/vim-nerdtree-tabs'       " keep NERDTree mirrored across tabs
Plug 'ntpeters/vim-better-whitespace'" highlight stray trailing whitespace
Plug 'scrooloose/nerdcommenter'      " fast toggle for code comments
Plug 'scrooloose/nerdtree'           " project drawer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'              " fuzzy file/grep picker (needs fzf binary)
Plug 'vim-airline/vim-airline'       " lightweight status/tab line
Plug 'vim-airline/vim-airline-themes'" airline theme pack (using jellybeans)
Plug 'github/copilot.vim'            " GitHub Copilot integration
call plug#end()

" --- Key leaders ---------------------------------------------------------
let mapleader = ","

" --- Core editing defaults ----------------------------------------------
syntax on
filetype plugin indent on

" Case-smart search that previews matches while typing.
set ignorecase
set smartcase
set incsearch

" Default to 2-space soft tabs, but align Python with standard 4 spaces.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
let g:tex_indent_brace=0
autocmd FileType python setlocal tabstop=4 shiftwidth=4

" Keep undo history across restarts; directory is created on demand.
if has('persistent_undo')
  let s:undo_dir = expand('~/.vim/undo')
  silent! call mkdir(s:undo_dir, 'p')
  execute 'set undodir=' . fnameescape(s:undo_dir)
  set undofile
endif

" --- Look and feel -------------------------------------------------------
if has("nvim")
  " atom-dark-256 expects the 256-color palette; stick with it in terminals.
  if exists('+termguicolors')
    set notermguicolors
  endif
  colorscheme atom-dark-256
  set list                           " reveal tabs/trailing whitespace
else
  colorscheme atom-dark
  highlight ColorColumn ctermbg=7
endif

set number                           " show absolute line numbers
set colorcolumn=81                   " highlight the 80-column boundary
set autoread                         " auto-reload files changed on disk
set clipboard=unnamedplus            " share clipboard with the OS
set splitbelow                       " open horizontal splits below
set splitright                       " open vertical splits to the right

" --- Navigation & mappings ----------------------------------------------
nnoremap <silent> <C-n> :NERDTreeTabsToggle<CR> " toggle tree view everywhere
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <Space>i :nohl<CR>          " drop search highlight quickly

" --- Plugin configuration ------------------------------------------------
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:airline_theme = 'jellybeans'
let g:NERDSpaceDelims = 1            " keep comment delimiters padded
nnoremap <F3> :Autoformat<CR>
let g:formatdef_clangformat = '"clang-format -style=file -fallback-style=google"'
let g:formatters_python = ['yapf']
let g:formatter_yapf_style = 'google'

" Interpret ROS launch files as XML for proper highlighting.
autocmd BufRead,BufNewFile *.launch setfiletype xml

" Work around Neovim TUI cursor-shape quirk.
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=
