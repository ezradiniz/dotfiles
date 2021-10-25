
.PHONY: all
all: utils nvim zsh tmux i3 alacritty git x11

.PHONY: nvim
nvim:
	sudo ln -sfn $(CURDIR)/nvim "$(HOME)/.config/nvim"

.PHONY: zsh
zsh:
	sudo ln -sn $(CURDIR)/zsh/zshrc "$(HOME)/.zshrc" 

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

.PHONY: x11
x11:
	sudo ln -sn $(CURDIR)/X11/30-touchpad.conf /etc/X11/xorg.conf.d

.PHONY: utils
utils:
	sudo sh ./utils/install.sh

