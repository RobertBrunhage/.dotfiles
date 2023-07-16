#!/usr/bin/env bash

stow --restow -t ~ git
stow --restow -t ~ bin
stow --restow -t ~ core
stow --restow -t ~ nvim
stow --restow -t ~ tmux
# if [ isWsl ]; then
  sudo stow --restow -t / wsl
# fi
stow --restow -t ~ zsh
