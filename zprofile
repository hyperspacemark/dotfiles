path=($HOME/.dotfiles/bin /usr/local/sbin /usr/local/bin $path)
if which hub > /dev/null; then eval "$(hub alias -s)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
