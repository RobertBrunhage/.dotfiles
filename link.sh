#!/bin/bash
# Symlinks the dotfiles into the home directory with stow. Safe to run again.

set -e
cd "$(dirname "$0")"

# Makes sure a file that belongs to this machine (not to this repo) exists and contains `line`.
# Symlinks left from when these files lived in this repo are replaced.
local_file() {
    local file="$1" line="$2"
    if [ -L "$file" ] && [ ! -e "$file" ]; then rm "$file"; fi
    touch "$file"
    if [ -n "$line" ] && ! grep -qxF "$line" "$file"; then echo "$line" >> "$file"; fi
}

# Without ~/.config stow would link all of it into this repo
mkdir -p ~/.config

for package in bin core git tmux zsh yabai skhd ghostty; do
    stow --restow -t ~ "$package"
done

# These stay files on this machine that load the shared config from this repo, so
# installers and tools (`gh auth login`, work setup scripts, ...) never write into the repo.
# Git reads ~/.config/git/config on its own, ~/.gitconfig only has to exist.
local_file ~/.zshrc "source ~/.config/zsh/zshrc"
local_file ~/.bashrc "source ~/.config/bash/bashrc"
local_file ~/.gitconfig

# Left over from the old layout
if [ -L ~/.zsh_profile ] && [ ! -e ~/.zsh_profile ]; then rm ~/.zsh_profile; fi

echo "All stow symlinking completed!"
