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
            # core.sh may have just installed Homebrew, put brew on PATH for the next scripts
            for brew in /opt/homebrew/bin/brew /usr/local/bin/brew; do
                [ -x "$brew" ] && eval "$("$brew" shellenv)" && break
            done
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

read -p "This will create symlinks for your dotfiles in your home directory, making them active. Do you want to run this step? [Y/n]: " run_stow
if [[ -z "$run_stow" || "$run_stow" =~ ^[Yy]$ ]]; then
    "$(dirname "$0")/link.sh"
else
    echo "Skipping stow symlinking."
fi
