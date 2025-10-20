#!/bin/bash
# Neovim setup for Linux

# Check if --config-only flag is passed
if [[ "$1" == "--config-only" ]]; then
    echo "Skipping neovim build, setting up configuration only..."
else
    rm -rf ~/neovim

    if [ ! -d "$HOME/neovim" ]; then
      git clone https://github.com/neovim/neovim.git "$HOME/neovim"
    fi

    sudo apt update
    sudo apt install -y ninja-build cmake gettext curl

    cd "$HOME/neovim" && make CMAKE_BUILD_TYPE=RelWithDebInfo -j 4
    cd "$HOME/neovim" && sudo make install

    echo "Neovim installed and built from source."
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"

# Remove old nvim config and clone fresh
echo "Setting up nvim configuration..."
rm -rf "$DOTFILES_DIR/nvim-config"
mkdir -p "$DOTFILES_DIR/nvim-config/.config/nvim"
git clone git@github.com:RobertBrunhage/nvim.git "$DOTFILES_DIR/nvim-config/.config/nvim"

# Use stow to create the symlink
echo "Setting up nvim configuration symlink with stow..."
cd "$DOTFILES_DIR"
stow --adopt --restow -t ~ nvim-config

echo "Nvim configuration setup complete!"
