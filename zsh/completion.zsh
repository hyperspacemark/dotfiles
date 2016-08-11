autoload -U compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending

g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status --short --branch --ignore-submodules
  fi
}
compdef g=git

_git_delete_branch() {
  __gitcomp "$(__git_heads)"
}

m() {
  man -t "$@" | open -f -a Preview
}
compdef m=man
