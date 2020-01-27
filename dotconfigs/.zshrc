# display the computer infos:
screenfetch

# --- PATHs
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$(npm get prefix)/bin:$PATH

# --- VARS
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10K_MODE="nerdfont-complete"

# --- Plugins
plugins=(
  osx zsh-completions cp docker go npm zsh-autosuggestions zsh-syntax-highlighting zsh-nvm
)

# --- Source
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.sh
source ~/.aliases
source ~/.aws-completion
source ~/.exports
source ~/.functions
source ~/.kubectl-completion
source ~/.minikube-completion

# --- Evals
# thefuck
eval $(thefuck --alias)

# --- Additional settings

# zsh-autosuggestions
autoload -U compinit && compinit

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# GoLang
export GOROOT=/Users/spetros/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/Users/spetros/go
export PATH=$GOPATH/bin:$PATH

# z goodness!!!
. ~/z.sh
