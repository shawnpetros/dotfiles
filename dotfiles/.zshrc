# --- PATHs
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# --- VARS

# need to source before plugins
source ~/.aliases
source ~/.exports
source ~/.functions

# --- Plugins
plugins=(
  macos zsh-nvm zsh-completions cp docker golang npm zsh-autosuggestions zsh-syntax-highlighting thefuck
)

# --- Source
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.aws-completion
# source ~/.kubectl-completion
# source ~/.minikube-completion

# --- Additional settings

# zsh-autosuggestions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
  complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# GoLang
# export GOROOT=/Users/spetros/.go
# export PATH=$GOROOT/bin:$PATH
# export GOPATH=/Users/spetros/go
# export PATH=$GOPATH/bin:$PATH

# z goodness!!!
. ~/z.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
