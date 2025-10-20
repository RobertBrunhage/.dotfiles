#!/bin/bash

set -e

OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
    echo "Detected macOS. Running setup scripts..."
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)/scripts/mac"
    # Ensure all scripts are executable
    chmod +x "$SCRIPT_DIR"/*.sh
    for script in "$SCRIPT_DIR"/*.sh; do
        if [ -f "$script" ]; then
            echo "Running $(basename "$script")..."
            "$script"
        fi
    done
    echo "All setup scripts executed for macOS."

elif [[ "$OS" == "Linux" ]]; then
    echo "Detected Linux. Running setup scripts..."
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)/scripts/linux"
    # Ensure all scripts are executable
    chmod +x "$SCRIPT_DIR"/*.sh
    for script in "$SCRIPT_DIR"/*.sh; do
        if [ -f "$script" ]; then
            echo "Running $(basename "$script")..."
            bash "$script"
        fi
    done
    echo "All setup scripts executed for Linux."
else
    echo "Unsupported OS: $OS"
    exit 1
fi

# Ensure git submodules are initialized and updated
read -p "This will download/update extra configuration files used by your dotfiles (git submodules). Do you want to run this step? [Y/n]: " run_submodule
if [[ -z "$run_submodule" || "$run_submodule" =~ ^[Yy]$ ]]; then
    git submodule update --init --recursive
else
    echo "Skipping git submodule update."
fi


read -p "This will create symlinks for your dotfiles in your home directory, making them active. Do you want to run this step? [Y/n]: " run_stow
if [[ -z "$run_stow" || "$run_stow" =~ ^[Yy]$ ]]; then
    cd .dotfiles-personal
    stow --restow -t ~ git
    cd ..

    stow --restow -t ~ bin
    stow --restow -t ~ core
    stow --restow -t ~ tmux
    stow --restow -t ~ zsh
    stow --restow -t ~ yabai
    stow --restow -t ~ skhd
    echo "All stow symlinking completed!"
else
    echo "Skipping stow symlinking."
fi
