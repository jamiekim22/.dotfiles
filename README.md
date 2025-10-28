# My Dotfiles 💻

This repository contain my personal dotfiles configuration for macOS, managed with GNU Stow for easy symlink management.
They will probably need some tweaking for them to work on your machine depending on your setup.

## Prerequisites

Before setting up these dotfiles, you need to install Homebrew:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Installation

### 1. Installed Required Packages

First, install all necessary packages using Homebrew Bundle:


```
brew bundle install
```
This will install all applications, CLI tools, and dependecies listed in the Brewfile.

### 2. Clone this Repository

Clone this .dotfiles repository to your $HOME directory:

```
git clone https://github.com/jamiekim22/.dotfiles.git 
```

### 3. Setup Directory Structure

**Important**: Before running any stow commands, ensure your home directory has the correct structure setup. 

For subdirectories that don't exist in `$HOME`, create them first:
- If any subdirectory (e.g., `~/.config`) doesn't exist in `$HOME`, run: `mkdir .config`
- Other config files that don't exist in `$HOME` should not cause problems for stow symlinks

### 4. Create Symlinks with GNU Stow
> [!IMPORTANT]
> Make sure you are in the .dotfiles directory before proceeding:

``` 
cd dotfiles
```

As long as you have the directory structure setup in `$HOME` correctly, running the following should be sufficient:
```
stow .
```

However, for assurance, you can run stow commands individually for each configuration directory and re-check if the symlinks are correct:

```
stow -t ~ starship zsh tmux
```

### 5. Verification

After running the stow commands, verify that the symlinks are correctly created for each subdirectory and file in your home directory.


## Usage

After installation, your configuration files will be symlinked from this repository to your home directory. Any changes you make to the files in this repository will immediately take effect in your system.

To add new configurations:

1. Add the files to the appropriate directory in this repository
2. Run `stow .` from the dotfiles directory to create new symlinks
3. Commit and push your changes

## Troubleshooting

- **Symlink conflicts**: If you get conflicts when running stow, you may need to backup and remove existing config files first
- **Missing directories**: Ensure parent directories exist in `$HOME` before running stow
- **Permission issues**: Make sure you have write permissions to your home directory

## Customization

Feel free to fork this repository and customize it for your own needs. The modular structure with GNU Stow makes it easy to add, remove, or modify individual configuration components.

