#!/bin/zsh
# Productivity tools setup for macOS, Homebrew packages are in the Brewfile

# node@22 isn't linked into the Homebrew bin, use it the same way .zshrc does
export PATH="$(brew --prefix node@22)/bin:$PATH"

# Install Hungrimind cli
npm install -g @hungrimind/hungrimind-cli

# Install Pnpm with npm
npm install -g pnpm@latest-10

# Install Vercel cli with pnpm
pnpm i -g vercel

echo "Productivity tools installed."
