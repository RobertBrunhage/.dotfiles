#!/bin/bash
# Core setup for Linux

# stow is needed early, the other scripts and install.sh symlink with it
sudo apt update
sudo apt install -y keychain stow

echo "Core Linux dependencies installed."
