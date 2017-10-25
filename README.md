# <img width="300" alt="dotfiles" src="https://user-images.githubusercontent.com/26120940/31855378-d846d97c-b65e-11e7-887a-0514f871dded.png">

Dotfiles are custom configuration files that allow you to configure settings and preferences for your machine. This repository contains my dotfiles that I maintain on my macOS and Arch Linux machines. Documentation is provided for my dotfiles in the `README.md` files in each subdirectory.

## Organization

I structured my dotfiles after @holman's dotfiles. Everything is organized into different topic areas. For example, if I have configuration files for a particular program—say, vim (and I do!)—I create a `vim` directory and put my files in there. Any file with a `.zsh` extension is automatically loaded into my shell. Any file with a `.symlink` extension gets symlinked (`ln -s`) into `$HOME` without the `.symlink` file extension when you run `install/bootstrap`.

- Anything in `bin/` gets added to `$PATH` and made available everywhere.
- `topic/*.zsh` files get loaded into your environment.
  - `topic/path.zsh` files are loaded first and are expected to setup `$PATH`.
  - `topic/completion.zsh` files are loaded last and are expected to setup autocompletion.
- `topic/install.sh` files are automatically executed during `install/bootstrap`.
- `topic/*.symlink` gets symlinked into `$HOME` during `install/bootstrap`.

## Install

Before you install these dotfiles, make sure that `zsh` is installed and configured to be the default shell for your terminal emulator. After `zsh` has been installed and is the default shell, run:

```bash
git clone https://github.com/nuttywhal/dotfiles ~/.dotfiles
cd ~/.dotfiles
install/bootstrap
```

<img width="523" alt="install/bootstrap" src="https://user-images.githubusercontent.com/26120940/32021754-2c7f3dae-b989-11e7-834d-750b25435c21.png">
