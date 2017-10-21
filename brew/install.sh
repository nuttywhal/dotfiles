#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)
cd "brew/"

source "$DOTFILES_ROOT/install/utils.sh"

install_homebrew() {
	star "Installing Homebrew"

	if [ test == $(which brew) ]
	then
		if [ $(uname) = "Darwin" ]
		then

			# 1. Install Homebrew.

			info "Press the <RETURN> key to confirm the installation"
			if ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null 2>&1
			then
				success "Homebrew has been installed"
			else
				fail "Homebrew has failed to install"
			fi

			# 2. Install Brewfile applications.

			info "Installing Brewfile applications (this may take a while)"
			brew bundle > /dev/null 2>&1
			success "Brewfile applications have been installed"
		fi
	else
		success "Homebrew has already been installed"
	fi
}

install_homebrew