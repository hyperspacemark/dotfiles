#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PROFILE="personal"

for arg in "$@"; do
  case "$arg" in
    --work) PROFILE="work" ;;
    --personal) PROFILE="personal" ;;
  esac
done

echo "Installing dotfiles (profile: $PROFILE)..."

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

# Gitconfig — profile-specific
if [[ "$PROFILE" == "work" ]]; then
  link "$DOTFILES_DIR/gitconfig.work" "$HOME/.gitconfig"
else
  link "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
fi

link "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"
link "$DOTFILES_DIR/config/starship.toml" "$HOME/.config/starship.toml"
link "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"
link "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.zshrc.d"
mkdir -p "$HOME/.zsh/cache"
for f in "$DOTFILES_DIR"/zsh/.zshrc.d/*.zsh; do
  link "$f" "$HOME/.zshrc.d/$(basename "$f")"
done

# Create ~/.zshrc.d/local.zsh stub if it doesn't exist
if [[ ! -f "$HOME/.zshrc.d/local.zsh" ]]; then
  if [[ "$PROFILE" == "work" ]]; then
    cat > "$HOME/.zshrc.d/local.zsh" << 'EOF'
# Machine-specific config — not tracked in git.

# Corporate proxy cert for Node.js tools (set path to your CA cert)
# export NODE_EXTRA_CA_CERTS=""

# Secrets
[[ -f ~/.secrets ]] && source ~/.secrets
EOF
  else
    cat > "$HOME/.zshrc.d/local.zsh" << 'EOF'
# Machine-specific config — not tracked in git.

# Secrets
[[ -f ~/.secrets ]] && source ~/.secrets
EOF
  fi
  echo "Created ~/.zshrc.d/local.zsh"
fi

# Create ~/.secrets stub if it doesn't exist
if [[ ! -f "$HOME/.secrets" ]]; then
  cat > "$HOME/.secrets" << 'EOF'
# Secrets — never commit this file
# export GITHUB_TOKEN=""
# export ANTHROPIC_API_KEY=""
EOF
  chmod 600 "$HOME/.secrets"
  echo "Created ~/.secrets stub — fill in your secrets"
fi

echo
echo "Done."
echo
echo "Next:"
if [[ "$PROFILE" == "work" ]]; then
  echo "  1. brew bundle --file \"$DOTFILES_DIR/Brewfile.work\""
else
  echo "  1. brew bundle --file \"$DOTFILES_DIR/Brewfile\""
fi
echo "  2. Fill in ~/.secrets"
echo "  3. Restart Terminal (or source ~/.zshrc)"
