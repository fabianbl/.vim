#!/bin/bash

# Copy vimrc.
cp vimrc ~/.vimrc

# Neovim configuration.
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -fs ~/.vim $XDG_CONFIG_HOME/nvim
ln -fs ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

# Get pathogen.
mkdir -p autoload bundle
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
