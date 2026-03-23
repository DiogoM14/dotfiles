#!/bin/bash
# Symlink dotfiles to ~/.config
# Usage: ./install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

for dir in "$DOTFILES_DIR"/config/*/; do
  name="$(basename "$dir")"
  target="$HOME/.config/$name"
  if [ -e "$target" ]; then
    echo "skipping $name (already exists)"
  else
    ln -s "$dir" "$target"
    echo "linked $name"
  fi
done

echo "Done."
