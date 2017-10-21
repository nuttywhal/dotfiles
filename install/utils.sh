#!/usr/bin/env bash

# Functions for printing different log messages and user prompts. fail()
# will terminate the script immediately after its error message is printed.
#
# $1 - message to be appended after the log level

star() {
	printf "\r \033[1;45m [ ★ ] $1 \033[0m \n"
}

info() {
	printf "\r  [ \033[0;34m.\033[0m ] $1\n"
}

user() {
	printf "\r  [ \033[0;33m?\033[0m ] $1"
}

success() {
	printf "\r\033[2K  [ \033[00;32m✓\033[0m ] $1\n"
}

fail() {
	printf "\r\033[2K  [ \033[0;31m✘\033[0m ] $1\n"
	echo ''
	exit
}

# Create a symbolic link to a target file. If destination of the symbolic link
# already exists, the user will be prompted to skip, overwrite, or backup the
# existing file.
#
# Make sure to define overwrite_all, backup_all, and skip_all in an outer scope
# before calling this function:
#
#   local overwrite_all=false backup_all=false skip_all=false
#
# $1 - path to the target file
# $2 - path to the symbolic link

link_file() {
	local src=$1 dst=$2
	local overwrite= backup= skip=
	local action=

	if [ -f "$dst" -o -d "dst" -o -L "$dst" ]
	then
		if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
		then
			local current_src="$(readlink $dst)"
			if [ "$current_src" == "$src" ]
			then
				skip=true;
			else
				prompt="[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all? "
				user "$dst ($(basename "$src")) already exists.\n\t$prompt"

				read -n 1 action

				case "$action" in
					o )
						overwrite=true;;
					O )
						overwrite_all=true;;
					b )
						backup=true;;
					B )
						backup_all=true;;
					s )
						skip=true;;
					S )
						skip_all=true;;
					* )
						;;
				esac
			fi
		fi

		overwrite=${overwrite:-$overwrite_all}
		backup=${backup:-$backup_all}
		skip=${skip:-$skip_all}

		if [ "$overwrite" == "true" ]
		then
			rm -rf "$dst"
			success "$dst (removed)"
		fi

		if [ "$backup" == "true" ]
		then
			mv "$dst" "${dst}.backup"
			success "$dst ▶ ${dst}.backup"
		fi

		if [ "$skip" == "true" ]
		then
			success "$src (skipped)"
		fi
	fi

	if [ "$skip" != "true" ]
	then
		ln -s "$1" "$2"
		success "$1 ▶ $2"
	fi
}
