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
cp zsh/zshenv ~/.zshenv

echo "Installed dotfiles sucessfully !"
