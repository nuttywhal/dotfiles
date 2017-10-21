#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

source "$DOTFILES_ROOT/install/utils.sh"

install_zsh() {
	star "Installing the Oh My Zsh framework"
	local overwrite_all=false backup_all=false skip_all=false

	# Check if Z shell (zsh) is the current shell.
	# Fail the installation if zsh is not detected.

	if [[ $SHELL == *"zsh"* ]] || [[ $0 == *"zsh"* ]]
	then
		success "Z shell (zsh) has been detected as the current shell"
	else
		fail "Z shell (zsh) is not the current default shell"
	fi

	# Install the Oh My Zsh, a framework for managing zsh configuration,
	# to the $HOME/.oh-my-zsh directory.

	OMZ_PATH="$HOME/.oh-my-zsh"
	if [ ! -d "$OMZ_PATH" ]
	then
		if git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$OMZ_PATH" > /dev/null 2>&1
		then
			success "Oh My Zsh has been installed to $OMZ_PATH"
		else
			fail "Oh My Zsh has failed to install"
		fi
	else
		success "Oh My Zsh has already been installed in $OMZ_PATH"
	fi

	# Install custom plugins to $OMZ_PATH/custom/plugins.
	# These are plugins that are not bundled with Oh My Zsh.

	cd $OMZ_PATH/custom/plugins

	git clone https://github.com/djui/alias-tips.git > /dev/null 2>&1
	success "alias-tips has been installed"

	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git > /dev/null 2>&1
	success "zsh-syntax-highlighting has been installed"
}

install_zsh
