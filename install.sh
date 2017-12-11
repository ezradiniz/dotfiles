#!/bin/sh

set -e

echo "- My dotfiles Install -"

echo "Loading the Vim configuration ..."
cp -r vim/ ~/.vim_config
cp vim/vimrc ~/.vimrc

echo "Loading Tmux configuration ..."
cp tmux/tmux.conf ~/.tmux.conf

echo "Loading Zsh configuration ..."
cp zsh/zshrc ~/.zshrc

echo "Setting files ..."
# Configure tern
npm install tern --prefix ~/.vim_config/plugins/tern_for_vim
# Configure completor
make js -C ~/.vim_config/plugins/completor.vim

echo "Installed dotfiles sucessfully !"
