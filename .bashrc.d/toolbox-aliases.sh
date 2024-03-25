#!/bin/bash

# utilities aliases
alias vim='toolbox run --container arch nvim ${1}'
alias ffprobe='toolbox run --container arch ffprobe ${1}'
alias ffmpeg='toolbox run --container arch ffmpeg ${1}'

# container maintenance aliases
alias arch-update='toolbox run --container arch sudo pacman -Syu' # update arch container
alias arch-update-fresh='toolbox run --container arch sudo pacman -Syyuu' # force pacman to dl fresh copy of the package db

## installs packages
toolbox-install-arch-packages() {
	toolbox run --container arch sudo pacman -Syu \
		neovim \
		ffmpeg \
		libva-mesa-driver \
		libva-utils
}

## recreates the arch container
toolbox-recreate-arch() {
	toolbox rm --force arch
	toolbox create --distro arch arch
	toolbox-install-arch-packages
}
