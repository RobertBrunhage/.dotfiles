#!/bin/bash
# Neovim setup for Linux

set -e

ARCH="$(uname -m)"
case "$ARCH" in
  x86_64) NVIM_ARCH="x86_64"; TS_ARCH="x64" ;;
  aarch64 | arm64) NVIM_ARCH="arm64"; TS_ARCH="arm64" ;;
  *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# ripgrep is used by the config, a C compiler builds the treesitter parsers
# and mason needs unzip to install language servers and formatters
sudo apt update
sudo apt install -y curl git ripgrep build-essential unzip

DOWNLOAD_DIR="$(mktemp -d)"

# apt's neovim is too old for the config, install the latest official release
NVIM_NAME="nvim-linux-$NVIM_ARCH"
curl -fL -o "$DOWNLOAD_DIR/$NVIM_NAME.tar.gz" "https://github.com/neovim/neovim/releases/latest/download/$NVIM_NAME.tar.gz"
sudo rm -rf "/opt/$NVIM_NAME"
sudo tar -C /opt -xzf "$DOWNLOAD_DIR/$NVIM_NAME.tar.gz"
sudo ln -sf "/opt/$NVIM_NAME/bin/nvim" /usr/local/bin/nvim

# Same for tree-sitter-cli, which nvim-treesitter uses to build parsers
curl -fL -o "$DOWNLOAD_DIR/tree-sitter.gz" "https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-$TS_ARCH.gz"
gunzip "$DOWNLOAD_DIR/tree-sitter.gz"
sudo install -m 755 "$DOWNLOAD_DIR/tree-sitter" /usr/local/bin/tree-sitter

rm -rf "$DOWNLOAD_DIR"
echo "Neovim $(nvim --version | head -1) installed."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
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
stow --adopt --restow -t ~ nvim-config

echo "Nvim setup complete!"
