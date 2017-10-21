`zsh` is the default shell that I use in my terminal. It provides a great interactive experience with fantastic tab completion and globbing. I use the [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) framework for managing my `zsh` configuration (themes and plugins).

`install.zsh` installs the Oh My Zsh framework and automatically install the plugins listed in the `ohmy.zsh` configuration file. To install custom plugins, append the plugin name to list of plugins in `ohmy.zsh` and modify `install.zsh` to install the plugin.

`aliases.zsh` contains several useful command aliases. `reload!` clears the terminal screen and sources `~/.zshrc` to reload `zsh` configuration in the middle of a terminal session. `ls` is aliased to show file sizes in human readable units of measurement and to group directories first in a listing. `cp` and `mv` are aliased to prompt for overwrites and to show verbose output.

`newline.zsh` outputs a new line character at the end of every command. Personally, I think it looks cleaner to have each command separated by a blank line.

`motd.zsh` displays a message of the day at the beginning of a terminal session outputting the current date, time, and weather.

<img width="359" alt="motd" src="https://user-images.githubusercontent.com/26120940/31855241-41b89574-b65c-11e7-907c-d6b5396e1079.png">
