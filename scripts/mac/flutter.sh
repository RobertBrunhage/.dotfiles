#!/bin/zsh
# Flutter setup for macOS

FLUTTER_DIR="$HOME/tools/flutter"

if [ ! -d "$FLUTTER_DIR" ]; then
  git clone git@github.com:flutter/flutter.git "$FLUTTER_DIR" --branch stable
  echo "Flutter cloned to $FLUTTER_DIR."
else
  echo "Flutter already exists at $FLUTTER_DIR."
fi

echo "Flutter setup complete."
