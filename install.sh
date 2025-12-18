#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1"
  local dst="$2"

  mkdir -p "$(dirname "$dst")"

  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "Refusing to overwrite non-symlink: $dst"
    echo "Move it aside first (e.g. mv $dst $dst.bak)"
    exit 1
  fi

  ln -sfn "$src" "$dst"
  echo "Linked $dst -> $src"
}

link "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"
link "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

mkdir -p "$HOME/.zshrc.d"
for f in "$DOTFILES_DIR"/zsh/.zshrc.d/*.zsh; do
  link "$f" "$HOME/.zshrc.d/$(basename "$f")"
done

echo
echo "Done. Restart Terminal or run: source ~/.zshrc"
echo "To install brew deps: brew bundle --file \"$DOTFILES_DIR/Brewfile\""
