#!/bin/bash

#enshure stow is installed
if !command -v stow &>/dev/null; then
  sudo pacman -S stow
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for conf in "$DOTFILES_PATH"/*/; do
  if [[ -d "$conf" ]]; then
    stow -d "$SCRIPT_DIR" -t "$HOME" "$(basename "$conf")"
  fi
done
