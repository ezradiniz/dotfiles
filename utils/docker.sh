#!/bin/sh
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER
su - $USER