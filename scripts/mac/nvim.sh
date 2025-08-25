#!/bin/zsh
# Neovim setup for macOS

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
