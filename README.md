# .vim #

## General ##

My vim/nvim config file and packages.

More packages on the [Vim Awesome](http://vimawesome.com/) page.

## Submodules ##

Add new submodules with:
```bash
git submodule add SUBMODULE
```

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

## Python ##

Enable Python support for Neovim:
```bash
pip  install --upgrade neovim
pip2 install --upgrade neovim
pip3 install --upgrade neovim
```

More information: https://github.com/neovim/neovim/wiki/FAQ#python-support-isnt-working

