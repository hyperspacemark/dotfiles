# Homebrew

eval "$(/opt/homebrew/bin/brew shellenv)"

# Version Managers

eval "$(pyenv init --path)"
eval "$(fnm env)"

# Locale

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Editor

export EDITOR="code --wait"
export VISUAL="$EDITOR"
