# 1. Homebrew — must be first, sets PATH/MANPATH/INFOPATH that everything else depends on
eval "$(/opt/homebrew/bin/brew shellenv)"

# 2. PATH additions — order matters, later entries win
eval "$(pyenv init --path)"    # adds ~/.pyenv/shims to PATH only
eval "$(fnm env)"              # adds fnm shims to PATH only

# 3. Locale — order-insensitive, but conventionally after PATH
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# 4. Editor — depends on nothing, just exports
export EDITOR="code --wait"
export VISUAL="$EDITOR"
