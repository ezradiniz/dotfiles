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

# Configure tern
cd ~/.vim_config/plugins/tern_for_vim
npm install tern

# Configure completor for js
cd ~/.vim_config/plugins/completor.vim
make js
cd ~/

echo "Installed dotfiles sucessfully !"
