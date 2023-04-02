#!/usr/bin/env bash

cd .dotfiles-personal
stow -D -t ~ git
cd ..

stow -D -t ~ bin 
stow -D -t ~ core
stow -D -t ~ nvim
stow -D -t ~ tmux
stow -D -t ~ zsh
stow -D -t ~ yabai 

cd .dotfiles-personal
stow -t ~ git
cd ..
stow -t ~ bin 
stow -t ~ core
stow -t ~ nvim
stow -t ~ tmux
stow -t ~ zsh
stow -t ~ yabai 
