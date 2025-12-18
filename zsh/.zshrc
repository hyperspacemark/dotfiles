# History

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

# ZSH Options

setopt autocd
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt correct
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Completions

# Add Homebrew's Zsh completions to fpath
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

# Completion UX
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
mkdir -p ~/.zsh/cache

autoload -Uz compinit
compinit -d ~/.zcompdump

bindkey '^I' menu-complete
bindkey '^[[Z' reverse-menu-complete

# Prompt

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# fzf

export FZF_DEFAULT_OPTS="
  --height 40%
  --layout=reverse
  --border
  --info=inline
  --preview-window=right:60%
"

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# bat

if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never"
fi

# Plugins

if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="${BREW_PREFIX:-$(brew --prefix)}"
  source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Additions

for f in ~/.zshrc.d/*.zsh; do
  source "$f"
done
