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
  osx zsh-completions cp docker go npm zsh-autosuggestions zsh-syntax-highlighting
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

# thefuck
eval $(thefuck --alias)
eval $(thefuck --alias FUCK)
eval $(thefuck --alias dammit)
# for thefuck
alias fuck="fuck --yeah"

# --- Additional settings

# zsh-autosuggestions
autoload -U compinit && compinit

# Enable tab completion for `g` by marking it as an alias for `git`
# Enable tab completion for `gg` so we can `git go $1` to co or make $1
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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
