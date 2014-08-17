# Aliases
source ~/.aliases

for config_file (~/.dotfiles/**/*.zsh) [[ "$(basename $config_file)" == "completion.zsh" ]] || source $config_file

# Initialize autocomplete
autoload -U compinit
compinit

# Load completions after loading autocomplete
for config_file (~/.dotfiles/zsh/completion.zsh) source $config_file

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
