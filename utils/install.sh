#!/usr/bin/sh

set -e

# TODO: install
#   tlp \
#   tlp-rdw \
#   curl \
#   tmux \
#   xclip \
#   ranger \
#   silversearcher-ag \
#   ripgrep \
#   fd-find \
#   bat

# docker
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER

# docker-compose
curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
