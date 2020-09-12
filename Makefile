
.PHONY: all
all: vim nvim zsh tmux i3 alacritty git utils

.PHONY: vim
vim:
	mkdir -p "$(HOME)/.vim/cache"
	sudo ln -sfn $(CURDIR)/vim/vimrc "$(HOME)/.vimrc"
	sudo ln -sfn $(CURDIR)/vim/coc-settings.json "$(HOME)/.vim/coc-settings.json"

.PHONY: nvim
nvim:
	mkdir -p "$(HOME)/.config/nvim"
	sudo ln -sfn $(CURDIR)/nvim/init.vim "$(HOME)/.config/nvim/init.vim"

.PHONY: zsh
zsh:
	sudo ln -sn $(CURDIR)/zsh/zshrc "$(HOME)/.zshrc" 
	sudo ln -sn $(CURDIR)/zsh/zshenv "$(HOME)/.zshenv" 

.PHONY: tmux
tmux:
	sudo ln -sfn $(CURDIR)/tmux/tmux.conf "$(HOME)/.tmux.conf"

.PHONY: i3
i3:
	sudo ln -sn $(CURDIR)/i3 "$(HOME)/.config/"

.PHONY: alacritty
alacritty:
	sudo ln -sfn $(CURDIR)/alacritty "$(HOME)/.config/"

.PHONY: git
git:
	sudo ln -sfn $(CURDIR)/git/gitconfig "$(HOME)/.gitconfig"

.PHONY: utils
utils:
	sudo sh ./utils/install.sh

