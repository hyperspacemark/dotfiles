source $HOME/.aliasrc

for zsh_source in $DOTFILES/**/*.zsh; do
  source $zsh_source
done

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
