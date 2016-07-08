source $HOME/.aliasrc

for zsh_source in $DOTFILES/**/*.zsh; do
  source $zsh_source
done

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES/bin/z.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
eval "$(rbenv init -)"
