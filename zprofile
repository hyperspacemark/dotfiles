path=($HOME/.dotfiles/bin /usr/local/sbin /usr/local/bin $path)
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi
if which hub > /dev/null; then eval "$(hub alias -s)"; fi
path=(.git/safe/../../bin .git/safe/../../bin/stubs $path)
