#!/usr/bin/env bash
# Symlink dotfiles into $HOME with GNU Stow.
# usage: ./install.sh [package...]          (defaults to all packages)
#        ./install.sh --update [package...] pull, check for conflicts, then stow
set -euo pipefail
cd "$(dirname "$0")"

command -v stow >/dev/null || { echo "stow not found: sudo apt install stow" >&2; exit 1; }

update=0
if [ "${1:-}" = "--update" ] || [ "${1:-}" = "-u" ]; then
    update=1
    shift
fi

# Make sure these exist as real dirs so stow links files inside them
# instead of turning the whole dir into a symlink.
mkdir -p "$HOME/.config" "$HOME/.local/bin"

packages=("$@")
[ ${#packages[@]} -eq 0 ] && packages=(git nvim scripts tmux zsh)

if [ "$update" -eq 1 ]; then
    git pull --ff-only
    # Dry run first: stow makes no changes, so a conflict leaves everything as it was
    if ! check=$(stow --restow --no --target="$HOME" "${packages[@]}" 2>&1); then
        echo "$check" >&2
        echo >&2
        echo "Nothing was changed. Move the files listed above aside, then run again." >&2
        exit 1
    fi
fi

stow --restow --target="$HOME" "${packages[@]}"
echo "Stowed: ${packages[*]}"
