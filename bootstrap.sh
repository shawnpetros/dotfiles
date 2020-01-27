#!/usr/bin/env bash

# ==================================================
# Step 1: Get user input
# ==================================================
if [ -z $OUTFITTED ]; then
  echo "Setting machine up"

  # Get name
  echo "What is your full name? <first> <last>"
  read NAME

  # Get email
  echo "Enter your email address?"
  read EMAIL
fi

# ==================================================
# Step 2: Install Apps, Tools and dotfiles
# ==================================================

echo "Installing brew and cask apps"
source ./brew.sh

# Install OH-MY-ZSH
echo "Installing OH-MY-ZSH, powerlevel9k and others"
# omzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# pl10k!
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# auto suggestions bo~i!
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# z, hop around!
cp z.sh ~

# Install nvm for zsh
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

if [ ! -d  ~/projects ]; then
  echo 'Creating your local development structure. ~/projects'
  mkdir ~/projects
else
  echo '"projects" dir already created'
fi

echo "Installing GO"
curl https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash

echo "Set up vim"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "VSCode Settings"
cp init/settings.json ~/Library/Application\ Support/Code/User

code_extensions=(
  aaron-bond.better-comments
  chenxsan.vscode-standardjs
  christian-kohler.npm-intellisense
  CoenraadS.bracket-pair-colorizer
  dbaeumer.vscode-eslint
  eamodio.gitlens
  esbenp.prettier-vscode
  extr0py.vscode-relative-line-numbers
  fabiospampinato.vscode-diff
  humao.rest-client
  joelday.docthis
  karigari.chat
  mauve.terraform
  mikestead.dotenv
  mohsen1.prettify-json
  ms-azuretools.vscode-docker
  ms-vsliveshare.vsliveshare
  ms-vsliveshare.vsliveshare-audio
  numso.prettier-standard-vscode
  Orta.vscode-jest
  patbenatar.advanced-new-file
  streetsidesoftware.code-spell-checker
  syler.sass-indented
  ue.alphabetical-sorter
  VisualStudioExptTeam.vscodeintellicode
  vscodevim.vim
  WallabyJs.quokka-vscode
  wesbos.theme-cobalt2
  wix.vscode-import-cost
)

if [[ -x $(which code) ]]; then
  echo "VSCode extensions"
  for ext in "${code_extensions[@]}"
  do
    code --install-extension "$ext"
  done
else
  echo "VSCode not installed correctly, install extensions manually."
fi

rsync -avh --no-perms ./dotconfigs ~;

# ==================================================
# Step 3: Github SSH and Global Config
# ==================================================
if [ ! -d ~/.ssh ]; then
  # SETUP SSH
  echo "Setting up SSH..."
  ssh-keygen -t rsa -b 4096 -C "$EMAIL"
fi

# ==================================================
# Step 4: Mac OS config and .zshrc
# ==================================================
source .macos

echo "YOU MADE IT!!! Restart your computer and you'll be good to go. ::AIR GUITAR SOLO::"
