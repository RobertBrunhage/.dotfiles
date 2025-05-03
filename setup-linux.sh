#!/usr/bin/env bash
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