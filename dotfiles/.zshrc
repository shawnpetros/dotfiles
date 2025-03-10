export ZSH="$HOME/.oh-my-zsh"

# need to source before plugins
source ~/.aliases
source ~/.exports
source ~/.functions

# On Linux brew we need to source the brew shellenv
# skip if not on linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

plugins=(git thefuck z zsh-nvm zsh-completions zsh-syntax-highlighting)

fpath+=$ZSH/custom/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration
eval "$(oh-my-posh --config ~/.config/oh-my-posh/zen.toml init zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
