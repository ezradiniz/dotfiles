#!/usr/bin/env bash

PLUGIN_DIR="plugins"

PLUGINS=(
  "mileszs/ack.vim"
  "jlanzarotta/bufexplorer"
  "ctrlpvim/ctrlp.vim"
  "Raimondi/delimitMate"
  "editorconfig/editorconfig-vim"
  "cohama/lexima.vim"
  "vim-scripts/mru.vim"
  "scrooloose/nerdcommenter"
  "Xuyuanp/nerdtree-git-plugin"
  "scrooloose/nerdtree"
  "myusuf3/numbers.vim"
  "AndrewRadev/splitjoin.vim"
  "ternjs/tern_for_vim"
  "tomtom/tlib_vim"
  "tpope/vim-abolish"
  "markonm/traces.vim"
  "leafgarland/typescript-vim"
  "vim-airline/vim-airline"
  "vim-airline/vim-airline-themes"
  "tpope/vim-commentary"
  "terryma/vim-expand-region"
  "tpope/vim-fugitive"
  "airblade/vim-gitgutter"
  "fatih/vim-go"
  "pangloss/vim-javascript"
  "peitalin/vim-jsx-typescript"
  "plasticboy/vim-markdown"
  "xolox/vim-misc"
  "terryma/vim-multiple-cursors"
  "tpope/vim-rhubarb"
  "scrooloose/snipmate-snippets"
  "garbas/vim-snipmate"
  "honza/vim-snippets"
  "tpope/vim-surround"
  "tmux-plugins/vim-tmux-focus-events"
  "maxbrunsfeld/vim-yankstack"
)

_install() {
  mkdir -p $PLUGIN_DIR
  for plugin in ${PLUGINS[@]}; do
    dirname="$(basename $plugin)"
    git clone https://github.com/$plugin.git $PLUGIN_DIR/$dirname
  done
}

_update() {
  for plugin in $PLUGIN_DIR/*; do
    echo -e "Updating... ${plugin}"
    git -C $plugin pull
  done
}

case $1 in
  -u | --update)  _update
      exit
      ;;
  -i | --install) _install
      exit
      ;;
esac

echo "done!"
