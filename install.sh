#!/bin/sh

set -e

echo "- My dotfiles Install -"

echo "Loading the Vim configuration ..."
cp -r vim/ ~/.vim_config
cp vim/vimrc ~/.vimrc
rm ~/.vim_config/vimrc
$(cd ~/.vim_config/ && ./plugin-setup.sh --install)

echo "Loading Tmux configuration ..."
cp tmux/tmux.conf ~/.tmux.conf

echo "Loading Zsh configuration ..."
cp zsh/zshrc ~/.zshrc
cp zsh/zshenv ~/.zshenv

echo "Loading Git configuration ..."
cp git/gitconfig ~/.gitconfig

echo "Loading Utils configuration ..."
for file in utils/*.sh; do
  bash "$file" -F || break
done

echo "Installed dotfiles sucessfully !"
