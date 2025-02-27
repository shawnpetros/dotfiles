export ZSH="$HOME/.oh-my-zsh"

# need to source before plugins
source ~/.aliases
source ~/.exports
source ~/.functions

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

plugins=(git thefuck zsh-nvm zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

fpath+=$ZSH/custom/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration
eval "$(oh-my-posh --config ~/.config/oh-my-posh/zen.toml init zsh)"
