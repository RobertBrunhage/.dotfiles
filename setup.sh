#!/usr/bin/env bash

cd .dotfiles-personal
stow --restow -t ~ git
cd ..

stow --restow -t ~ aerospace
stow --restow -t ~ bin
stow --restow -t ~ core
stow --restow -t ~ nvim
stow --restow -t ~ tmux
stow --restow -t ~ zsh
stow --restow -t ~ yabai
stow --restow -t ~ skhd
stow --restow -t ~ alacritty
