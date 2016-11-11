# .vim #

## General ##

My vim/nvim config file and packages.

More packages on the [Vim Awesome](http://vimawesome.com/) page.

## Submodules ##

Add new submodules with:
```bash
git submodule add SUBMODULE
```

Update all submodules to master:
```bash
git submodule foreach "(git checkout master; git pull)&"
```

More info here: http://stackoverflow.com/questions/1030169/easy-way-pull-latest-of-all-submodules

## Ctags ##

Install ctags on Ubuntu 14.04 with:
```bash
sudo apt-get install exuberant-ctags
```

Run inside the project folder:
```bash
ctags -R .
```

Jump to a specific tag in vim:
```vim
:tag <tagname>
```

Open a new window of the specified tag:
```vim
:stag <tagname>
```

Show all matches (for new window `stselect`):
```vim
:tselect <tagname>
```

Position cursor over command/variable and jump to definition with `Ctrl-]`. To open a new window, use `Ctrl-W ]`.

Show all matches for cursor position command/variable with `g]` or `Ctrl-W g]` for new split window.

Return from tag with `:pop` command or `Ctrl-t`.

More information:
http://vim.wikia.com/wiki/Browsing_programs_with_tags

## NERDTree ##

Find current file:
```vim
:NERDTreeFind
```

## Splits / Tabs ##

To change *two* vertically split windows to horizonally split:
<kbd>Ctrl</kbd>-<kbd>w</kbd> <kbd>t</kbd> <kbd>Ctrl</kbd>-<kbd>w</kbd> <kbd>K</kbd>

Horizontally to vertically: 
<kbd>Ctrl</kbd>-<kbd>w</kbd> <kbd>t</kbd> <kbd>Ctrl</kbd>-<kbd>w</kbd> <kbd>H</kbd>

Note: <kbd>Ctrl</kbd>-<kbd>w</kbd> <kbd>t</kbd> can be omitted with only two open splits.

# Possible Extensions #

## Python ##

Enable Python support for Neovim:
```bash
pip  install --upgrade neovim
pip2 install --upgrade neovim
pip3 install --upgrade neovim
```

More information: https://github.com/neovim/neovim/wiki/FAQ#python-support-isnt-working

## Deoplete ##

Add this to vimrc:
```vim
" Set python path.
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Should also be posssible with pathegon.
set runtimepath+=~/.vim/deoplete.nvim/
execute deoplete#enable()
let deoplete#tag#cache_limit_size = 5000000
```

Probably it will be necessary to use [deoplete-clang](https://github.com/zchee/deoplete-clang).
