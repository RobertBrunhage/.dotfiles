#!/bin/zsh
# Productivity tools setup for macOS

# Install Homebrew packages (one per line for clarity)
brew install tmux
brew install stow
brew install ripgrep
brew install fzf
brew install tldr
brew install prettier
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install discord
brew install notion
brew install font-hack-nerd-font
brew install stripe/stripe-cli/stripe
brew install go

# Install Homebrew cask packages (one per line)
brew install --cask yubico-authenticator

# Install Ghostty
brew install --cask ghostty

# Install Raycast
brew install --cask raycast

# Install Hungrimind cli
npm install -g @hungrimind/hungrimind-cli

# Install Pnpm with npm
npm install -g pnpm@latest-10

# Install Vercel cli with pnpm
pnpm i -g vercel

echo "Productivity tools installed via Homebrew."
