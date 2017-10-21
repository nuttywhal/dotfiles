# Automatically update Oh My Zsh without prompting...
# and pray that nothing breaks. Live on the bleeding edge!

DISABLE_UPDATE_PROMPT=true

# ZSH:        The path to the Oh My Zsh installation directory
#
# ZSH_CUSTOM: The path to Oh My Zsh's custom directory.
#             Whatever you place inside of it will take precedence
#             over the built-in configuration.
#
# ZSH_THEME:  The name of the zsh theme to use. All of the current
#             themes can be found in $ZSH/themes.

ZSH=~/.oh-my-zsh/
ZSH_CUSTOM=~/.oh-my-zsh/custom
ZSH_THEME="cypher"

# The list of plugins to enable.
# Custom plugins are installed in zsh/install.sh.

plugins=(alias-tips git zsh-syntax-highlighting)

# Initialize Oh My Zsh.

source $ZSH/oh-my-zsh.sh
