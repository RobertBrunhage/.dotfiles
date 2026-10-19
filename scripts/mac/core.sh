#!/bin/zsh
# Core setup for macOS

# Install Homebrew
if ! command -v brew > /dev/null && [ ! -x /opt/homebrew/bin/brew ] && [ ! -x /usr/local/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# A fresh install isn't on PATH yet (Apple silicon or Intel location)
for brew in /opt/homebrew/bin/brew /usr/local/bin/brew; do
  [ -x "$brew" ] && eval "$("$brew" shellenv)" && break
done

# The other scripts and install.sh symlink with stow
brew install stow

echo "Core setup complete (Homebrew installed)."
