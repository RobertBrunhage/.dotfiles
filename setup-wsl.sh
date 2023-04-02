#!/usr/bin/env bash

stow -D -t ~ git
stow -D -t ~ bin 
stow -D -t ~ core
stow -D -t ~ nvim
stow -D -t ~ tmux
# if [ isWsl ]; then
  sudo stow -D -t / wsl
# fi
stow -D -t ~ zsh

stow -t ~ git
stow -t ~ bin 
stow -t ~ core
stow -t ~ nvim
stow -t ~ tmux
# if [ isWsl ]; then
  sudo stow -t / wsl
# fi
stow -t ~ zsh
