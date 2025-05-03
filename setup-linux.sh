#!/bin/bash

# Exit on error
set -e

# Function to print status messages
print_status() {
    echo -e "\n\033[1;34m==>\033[0m \033[1m$1\033[0m"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install packages
install_packages() {
    print_status "Updating package lists..."
    sudo apt update

    print_status "Installing essential packages..."
    sudo apt install -y \
        git \
        curl \
        wget \
        build-essential \
        software-properties-common \
        python3-full \
        python3-pip \
        python3-venv \
        tmux \
        fzf \
        tldr \
        ripgrep \
        stow \
        ninja-build \
        gettext \
        libtool \
        libtool-bin \
        autoconf \
        automake \
        cmake \
        g++ \
        pkg-config \
        unzip \
        zsh

    # Install Node.js and npm if not present
    if ! command_exists node; then
        print_status "Installing Node.js..."
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt install -y nodejs
    fi

    # Install Rust if not present
    if ! command_exists rustc; then
        print_status "Installing Rust..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "$HOME/.cargo/env"
    fi
}

# Function to setup Zsh (optional)
setup_zsh() {
    print_status "Setting up Zsh..."
    
    # Install Oh My Zsh if not present
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        print_status "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi

    # Install Zsh plugins
    if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
        print_status "Installing zsh-autosuggestions plugin..."
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi

    if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
        print_status "Installing zsh-syntax-highlighting plugin..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi
}

# Function to setup Neovim
setup_neovim() {
    print_status "Setting up Neovim..."
    
    # Remove existing neovim installation
    rm -rf ~/neovim

    # Clone and build Neovim
    git clone https://github.com/neovim/neovim.git ~/neovim
    cd ~/neovim
    make CMAKE_BUILD_TYPE=RelWithDebInfo -j $(nproc)
    sudo make install
    cd -

    # Create and setup Python virtual environment for Neovim
    print_status "Setting up Python virtual environment for Neovim..."
    python3 -m venv ~/.venv/nvim
    source ~/.venv/nvim/bin/activate
    pip install --upgrade pip
    pip install pynvim
    deactivate

    # Add virtual environment to Neovim's Python path
    mkdir -p ~/.config/nvim
    echo "let g:python3_host_prog = '$HOME/.venv/nvim/bin/python'" > ~/.config/nvim/init.vim

    # Install Neovim Lua support
    if command_exists luarocks; then
        luarocks install --server=http://rocks.moonscript.org mpack
    fi
}

# Function to setup development tools
setup_dev_tools() {
    print_status "Setting up development tools..."

    # Install Flutter if not present
    if ! command_exists flutter; then
        print_status "Installing Flutter..."
        # Remove existing Flutter installation if it exists
        rm -rf "$HOME/tools/flutter"
        mkdir -p "$HOME/tools"
        git clone https://github.com/flutter/flutter.git "$HOME/tools/flutter"
        export PATH="$PATH:$HOME/tools/flutter/bin"
        flutter doctor
    fi

    # Install additional development tools
    print_status "Installing additional development tools..."
    sudo apt install -y \
        clang \
        cmake \
        ninja-build \
        pkg-config \
        libgtk-3-dev \
        lldb
}

setup_dotfiles() {
    git submodule update --init --recursive
    rm ~/.bashrc
    rm ~/.zshrc

    cd .dotfiles-personal
    stow --restow -t ~ git
    cd ..

    stow --restow -t ~ bin
    stow --restow -t ~ core
    stow --restow -t ~ nvim
    stow --restow -t ~ tmux
    stow --restow -t ~ zsh

chsh -s $(which zsh)
}

# Main installation process
main() {
    print_status "Starting Linux setup..."

    # Check if running as root
    if [ "$EUID" -eq 0 ]; then
        echo "Please don't run this script as root"
        exit 1
    fi

    # Install basic packages
    install_packages

    # Setup Neovim
    setup_neovim

    # Setup development tools
    setup_dev_tools

    # Setup Zsh (optional)
    setup_zsh

    # Setup dotfiles
    setup_dotfiles


    print_status "Setup completed successfully!"
    print_status "Please restart your terminal to apply all changes."
    print_status "To use Zsh, run: chsh -s $(which zsh)"
}

# Run the main function
main 