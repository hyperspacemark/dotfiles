g() {
  if [[ $# -eq 0 ]]; then
    git status
  else
    git "$@"
  fi
}

gbc() {
  local branch="$1"
  if [[ -z "$branch" ]]; then
    echo "usage: gbc <branch-name>" >&2
    return 2
  fi

  git switch -c "$branch" || return $?

  git push -u origin "$branch"
}

gco() {
  if [[ -z "$1" ]]; then
    git branch
  else
    git switch "$@"
  fi
}

gcof() {
  local branch
  branch="$(git branch --all --format='%(refname:short)' \
    | sed 's|^remotes/||' \
    | sort -u \
    | fzf)" || return
  [[ -n "$branch" ]] || return
  git switch "$branch"
}

glogf() {
  git log --oneline --decorate --color=always \
    | fzf --ansi --no-sort --tiebreak=index --reverse --height 40% \
          --preview 'git show --color=always {1}'
}

gprune() {
  git fetch --prune --prune-tags

  local current
  current="$(git branch --show-current 2>/dev/null)" || return 0

  git branch -vv \
    | awk '/: gone]/{print $1}' \
    | while read -r b; do
      [[ -z "$b" ]] && continue
      [[ "$b" == "$current" ]] && continue
      case "$b" in
        main|master|develop) continue ;;
      esac
      git branch -d "$b"
    done
}

gbd() {
  local force_flag=""
  if [[ "$1" == "-D" ]]; then
    force_flag="-D"
    shift
  fi

  local branch="$1"
  if [[ -z "$branch" ]]; then
    echo "usage: gbd [-D] <branch-name>" >&2
    return 2
  fi

  # Never let this nuke mainline branches
  case "$branch" in
    main|master|develop)
      echo "refusing to delete protected branch: $branch" >&2
      return 3
      ;;
  esac

  # Delete local branch first
  if [[ -n "$force_flag" ]]; then
    git branch -D "$branch" || return $?
  else
    git branch -d "$branch" || return $?
  fi

  # Then delete remote branch (ignore if already gone)
  git push origin --delete "$branch" 2>/dev/null || true
}

# Completion for gbd (adds -D + branch-name completion)
_gbd() {
  local -a opts
  opts=(-D)

  # first arg: offer -D and branch names
  if (( CURRENT == 2 )); then
    _describe -t options 'options' opts
    _git-branch
    return
  fi

  # after -D: offer branch names
  if [[ "${words[2]}" == "-D" ]]; then
    _git-branch
    return
  fi

  _git-branch
}
compdef _gbd gbd

compdef _git gbc=git-switch
compdef _git gco=git-switch
compdef _git gprune=git-fetch
compdef _git gcof=git-switch
