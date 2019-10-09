# --- PATHs
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$(npm get prefix)/bin:$(go env GOPATH)/bin:$PATH

# --- VARS
ZSH_THEME=""
POWERLEVEL9K_MODE="nerdfont-complete"

# --- Plugins
plugins=(
  git osx zsh-completions colorize cp docker go npm zsh-autosuggestions zsh-syntax-highlighting
)
fpath=(/usr/local/share/zsh-completions $fpath)

# --- Source
source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.aws-completion
source ~/.exports
source ~/.functions
source ~/.kubectl-completion
source ~/.minikube-completion

# --- Evals
# Evaluate docker-machine vars
eval $(docker-machine env default)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias fuck)
eval $(thefuck --alias dammit)

# --- Additional settings

# Pure prompt
autoload -U compinit promptinit;compinit && promptinit
prompt pure


# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# z goodness!!!
. ~/z.sh
