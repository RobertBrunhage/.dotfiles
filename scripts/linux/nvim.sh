#!/bin/bash
# Neovim setup for Linux

rm -rf ~/neovim

if [ ! -d "$HOME/neovim" ]; then
  git clone https://github.com/neovim/neovim.git "$HOME/neovim"
fi

sudo apt update
sudo apt install -y ninja-build cmake gettext curl

cd "$HOME/neovim" && make CMAKE_BUILD_TYPE=RelWithDebInfo -j 4
cd "$HOME/neovim" && sudo make install

echo "Neovim installed and built from source."
