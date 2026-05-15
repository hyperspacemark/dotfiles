# Homebrew

eval "$(/opt/homebrew/bin/brew shellenv)"

# Local bin

export PATH="$HOME/.local/bin:$PATH"

# Version Managers

command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init --path)"
command -v fnm   >/dev/null 2>&1 && eval "$(fnm env)"

# Locale

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Editor

export EDITOR="code --wait"
export VISUAL="$EDITOR"
