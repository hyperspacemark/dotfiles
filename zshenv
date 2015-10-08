typeset -U path

export LANG=en_US.UTF-8
export EDITOR=vim
export DOTFILES=$HOME/.dotfiles
export RBENV_ROOT=$HOME/.rbenv
export REMOTE_GEM_CACHE_PATH=$HOME/.remote_gem_cache
export ZSH_HISTORY_PATH=$HOME/.zsh_history
export HOMEBREW_SEARCH_CACHE_PATH=$HOME/.homebrew_search_cache
export SHABU_REPO="~/Development/Venmo/shabu"

[[ -f ~/.dotfilesecrets ]] && source ~/.dotfilesecrets
