ff() {
  local file

  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    file="$(
      git ls-files -co --exclude-standard \
      | fzf --height 40% --reverse \
            --preview 'bat --style=numbers --color=always {}'
    )" || return
  else
    file="$(
      find . -type f \
        -not -path '*/.git/*' \
        -not -path '*/.build/*' \
        -not -path '*/DerivedData/*' \
      | sed 's|^\./||' \
      | fzf --height 40% --reverse \
            --preview 'bat --style=numbers --color=always {}'
    )"
  fi

  [[ -n "$file" ]] || return
  command ${=EDITOR:-code} -- "$file"
}

ffa() {
  local file
  file="$(find . -type f -not -path '*/.git/*' | sed 's|^\./||' \
    | fzf --height 40% --reverse \
          --preview 'bat --style=numbers --color=always {}'
  )" || return
  [[ -n "$file" ]] || return
  command ${=EDITOR:-code} -- "$file"
}

fif() {
  local query="$1"
  [[ -n "$query" ]] || { echo "usage: fif <text>" >&2; return 2; }

  rg --hidden --glob '!.git/*' --glob '!.build/*' --glob '!DerivedData/*' -n "$query" \
    | fzf --delimiter : --nth 3.. --reverse --height 40% \
          --preview 'bat --style=numbers --color=always --highlight-line {2} -- {1}' \
          --bind 'enter:execute:code --wait --goto {1}:{2}'
}

j() {
  local dir
  dir="$(
    find "$HOME/Developer" -maxdepth 5 -type d -name .git -prune -print 2>/dev/null \
      | sed 's|/.git$||' \
      | fzf --query "${*:-}"
  )" || return

  [[ -n "$dir" ]] || return
  cd "$dir"
}
