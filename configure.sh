#!/usr/bin/env bash

# Prepare Neovim config directory
mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}"

# Symlink ~/.vimrc -> ~/.vim/vimrc
ln -fs ~/.vim/vimrc ~/.vimrc

# Symlink ~/.vim -> ~/.config/nvim (for Neovim)
ln -fs ~/.vim "$XDG_CONFIG_HOME/nvim"

# Symlink ~/.vimrc -> ~/.config/nvim/init.vim (Neovim expects init.vim)
ln -fs ~/.vimrc "$XDG_CONFIG_HOME/nvim/init.vim"

# Install vim-plug (plugin manager) if not already present
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
