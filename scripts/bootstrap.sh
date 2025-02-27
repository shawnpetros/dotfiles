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
echo "Installing OH-MY-ZSH, oh-my-posh and stuff"
# omzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-posh
brew install jandedobbeleer/oh-my-posh/oh-my-posh

# zsh completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# auto suggestions bo~i!
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install nvm for zsh
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# z, hop around!
cp z.sh ~

if [ ! -d ~/git_repos ]; then
  echo 'Creating your local development structure. ~/git_repos'
  mkdir ~/git_repos
else
  echo '"git_repos" dir already created'
fi

echo "Installing GO"
curl https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash

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
# source .macos

echo "YOU MADE IT!!! Restart your computer and you'll be good to go. ::AIR GUITAR SOLO::"
