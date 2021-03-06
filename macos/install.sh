#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)
cd "brew/"

source "$DOTFILES_ROOT/install/utils.sh"

install_macos_settings() {
	if [ $(uname) = "Darwin" ]
	then
		star "Installing macOS settings"

		# Dock settings.
		success "Setting up dock configuration"
		defaults write com.apple.dock autohide -bool true
		defaults write com.apple.dock tilesize -int 48
		defaults write com.apple.dock largesize -float 64
		killall Dock

		# Keyboard settings.
		success "Cranking up DAS and ARR settings"
		defaults write -g ApplePressAndHoldEnabled -bool false
		defaults write -g InitialKeyRepeat -int 15
		defaults write -g KeyRepeat -int 2

		# Mouse settings.
		success "Disabling mouse acceleration"
		defaults write .GlobalPreferences com.apple.mouse.scaling -1

		# Turn on dark mode.
		success "Turning off the lights (dark mode)"
		dark-mode on
	fi
}

install_macos_settings
