#!/usr/bin/sh

set -e

# package manager
sudo pacman -S yay

# misc
yay -S tlp openssl zlib
sudo tlp start

# font
yay -S ttf-nerd-fonts-hack-complete-git

# terminal
yay -S tmux zsh oh-my-zsh-git
chsh -s $(which zsh)

# tools
yay -S fzf fzf-extras ripgrep fd bat ranger

# docker
yay -S docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
