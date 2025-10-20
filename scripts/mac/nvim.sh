#!/bin/zsh
# Neovim setup for macOS

# Check if --config-only flag is passed
if [[ "$1" == "--config-only" ]]; then
    echo "Skipping neovim build, setting up configuration only..."
else
    # Remove old neovim
    rm -rf ~/neovim

    # Clone Neovim
    if [ ! -d "$HOME/neovim" ]; then
      git clone https://github.com/neovim/neovim.git "$HOME/neovim"
    fi

    # Install required packages
    brew install ninja cmake gettext curl

    # Build Neovim
    cd "$HOME/neovim" && make CMAKE_BUILD_TYPE=RelWithDebInfo -j 4

    # Install Neovim
    cd "$HOME/neovim" && sudo make install

    echo "Neovim installed and built from source."
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${0:A}")" && pwd)"
DOTFILES_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"

# Debug: Print the paths to verify
echo "Script directory: $SCRIPT_DIR"
echo "Dotfiles directory: $DOTFILES_DIR"

# Remove old nvim config and clone fresh
echo "Setting up nvim configuration..."
rm -rf "$DOTFILES_DIR/nvim-config"
mkdir -p "$DOTFILES_DIR/nvim-config/.config/nvim"
git clone git@github.com:RobertBrunhage/nvim.git "$DOTFILES_DIR/nvim-config/.config/nvim"

# Use stow to create the symlink
echo "Setting up nvim configuration symlink with stow..."
cd "$DOTFILES_DIR"
stow --restow -t ~ nvim-config

echo "Nvim configuration setup complete!"
