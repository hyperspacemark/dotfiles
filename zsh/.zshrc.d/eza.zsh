if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -la --icons --git'
  alias lt='eza --tree --icons'
fi
