
.PHONY: all
all: nvim zsh tmux i3 term git x11

.PHONY: nvim
nvim:
	sudo ln -sn $(CURDIR)/nvim "$(HOME)/.config/nvim"

.PHONY: zsh
zsh:
	sudo ln -sn $(CURDIR)/zsh/zshrc "$(HOME)/.zshrc"

.PHONY: tmux
tmux:
	sudo ln -sn $(CURDIR)/tmux/tmux.conf "$(HOME)/.tmux.conf"

.PHONY: i3
i3:
	sudo ln -sn $(CURDIR)/i3 "$(HOME)/.config/"

.PHONY: term
term:
	sudo ln -sn $(CURDIR)/ghostty "$(HOME)/.config/"

.PHONY: git
git:
	sudo ln -sn $(CURDIR)/git/gitconfig "$(HOME)/.gitconfig"

.PHONY: x11
x11:
	sudo ln -sn $(CURDIR)/X11/30-touchpad.conf /usr/share/X11/xorg.conf.d
