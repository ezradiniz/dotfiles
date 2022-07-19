
.PHONY: all
all: nvim zsh tmux i3 alacritty git x11

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

.PHONY: term
term:
	sudo ln -sfn $(CURDIR)/alacritty "$(HOME)/.config/"

.PHONY: git
git:
	sudo ln -sfn $(CURDIR)/git/gitconfig "$(HOME)/.gitconfig"
	sudo ln -sfn $(CURDIR)/git/gitignore "$(HOME)/.gitignore"

.PHONY: x11
x11:
	sudo ln -sn $(CURDIR)/X11/30-touchpad.conf /usr/share/X11/xorg.conf.d
