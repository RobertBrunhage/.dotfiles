#!/bin/zsh
# Neovim setup for macOS

# Neovim and the tools the config needs are installed by the Brewfile (core.sh)

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${0:A}")" && pwd)"
DOTFILES_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"
NVIM_CONFIG_DIR="$DOTFILES_DIR/nvim-config/.config/nvim"

# The config is its own repo, only clone it once so local changes are kept
if [ ! -d "$NVIM_CONFIG_DIR" ]; then
  echo "Cloning nvim configuration..."
  git clone git@github.com:RobertBrunhage/nvim.git "$NVIM_CONFIG_DIR"
else
  echo "nvim configuration already exists at $NVIM_CONFIG_DIR."
fi

# Use stow to create the symlink. ~/.config has to exist first,
# otherwise stow links all of ~/.config into this repo instead of only nvim
echo "Setting up nvim configuration symlink with stow..."
mkdir -p ~/.config
cd "$DOTFILES_DIR"
stow --restow -t ~ nvim-config

echo "Nvim setup complete!"
