#!/usr/bin/env zsh

# What city are you in?
# http://pastebin.com/dbtemx5F

CITY="MESA"

# Output the MOTD.

TEXT="\033[3;34mYour wish is my command...\033[0m"
DATE="\033[1;32m$(date "+%B %d, %Y") \033[0m▪\033[1;31m $(date "+%I:%M %P")"
WEATHER="$($HOME/.dotfiles/bin/weather $CITY)"

echo -e " \033[1;34m╔════════════════╗\033[0m   $TEXT"
echo -e " \033[7;34m  nutty@snowshoe  \033[0m   $DATE"
echo -e " \033[1;34m╚════════════════╝\033[0m   $WEATHER"

