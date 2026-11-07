#!/usr/bin/env bash
# Symlink dotfiles into $HOME with GNU Stow.
# usage: ./install.sh [package...]   (defaults to all packages)
set -euo pipefail
cd "$(dirname "$0")"

command -v stow >/dev/null || { echo "stow not found: sudo apt install stow" >&2; exit 1; }

# Make sure these exist as real dirs so stow links files inside them
# instead of turning the whole dir into a symlink.
mkdir -p "$HOME/.config" "$HOME/.local/bin"

packages=("$@")
[ ${#packages[@]} -eq 0 ] && packages=(git nvim scripts tmux zsh)

stow --restow --target="$HOME" "${packages[@]}"
echo "Stowed: ${packages[*]}"
