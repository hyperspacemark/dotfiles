function zle-line-init zle-keymap-select zle-line-finish {
  if [ "$TERM" = "xterm-256color" ]; then
    if [ $KEYMAP = vicmd ]; then
      echo -ne "\e[2 q"
    else
      echo -ne "\e[4 q"
    fi
  fi
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish

export KEYTIMEOUT=1
