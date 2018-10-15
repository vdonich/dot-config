DOTFILES_DIR := $(shell echo $(HOME)/dot-config)
SHELL        := /bin/sh
UNAME        := $(shell uname -s)
USER         := $(shell whoami)

ifeq ($(UNAME), Darwin)
  OS         := macos
else ifeq ($(UNAME), Linux)
  OS         := linux
endif

.PHONY: all install

all: install

install: $(OS)

.PHONY: help usage
.SILENT: help usage

help: usage

usage:
	printf "\\n\
	\\033[1mdot-config\\033[0m\\n\
	\\n\
	Custom macOS settings and terminal configurations.\\n\
	See README.md for detailed usage information.\\n\
	\\n\
	\\033[1mUSAGE:\\033[0m make [target]\\n\
	\\n\
	  make         Install all configurations and applications.\\n\
	\\n\
	  make link    Symlink only Bash configurations to the home directory.\\n\
	\\n\
	  make unlink  Remove symlinks created by \`make link\`.\\n\
	\\n\
	"

.PHONY: linux macos link unlink

linux: apt stow
	. $(HOME)/.bash_profile

macos: bash brew consolas npm eslint stow
	bash $(DOTFILES_DIR)/macos/defaults.sh
	stow macos
	. $(HOME)/.bash_profile

link:
	ln -fs $(DOTFILES_DIR)/bash/.bash_profile $(HOME)/.bash_profile
	ln -fs $(DOTFILES_DIR)/bash/.bashrc $(HOME)/.bashrc
	ln -fs $(DOTFILES_DIR)/bash/.inputrc $(HOME)/.inputrc

unlink:
	unlink $(HOME)/.bash_profile
	unlink $(HOME)/.bashrc
	unlink $(HOME)/.inputrc
	@printf "\\033[32m✓\\033[0m Symlinks removed. Manually remove ~/dot-config directory if needed.\\n"

.PHONY: apt bash brew stow

apt:
	bash $(DOTFILES_DIR)/linux/apt.sh

bash: brew
	echo /usr/local/bin/bash | sudo tee -a /etc/shells
	chsh -s /usr/local/bin/bash

brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | /usr/bin/ruby
	brew bundle --file=$(DOTFILES_DIR)/macos/.Brewfile

consolas:
	cd $(mktemp -d); \
	  curl -LO https://sourceforge.net/projects/mscorefonts2/files/cabs/PowerPointViewer.exe; \
	  cabextract PowerPointViewer.exe; \
	  cabextract ppviewer.cab; \
	  open CONSOLA*.TTF;

npm:
	mkdir -p $(HOME)/.npm-packages

eslint: npm stow
	npm install -g eslint eslint-config-google eslint-plugin-html

stow:
	stow bash
	stow git
	stow npm
	stow Documents
	stow emacs
