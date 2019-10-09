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

# Install node modules and junk
# add other global node modules here
node_modules=(
  eslint
  n
  nodemon
  npm # to upgrade npm in the process
  pure-prompt
  standard
  tern
)

for module in "${node_modules[@]}"
do
  if [[ "$(which npm)" ]]; then
    npm i -g "$module"
  fi
done

# Install OH-MY-ZSH
echo "Installing OH-MY-ZSH, powerlevel9k and others"
# omzsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
# pl9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# auto suggestions bo~i!
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# z, hop around!
cp z.sh ~

if [ ! -d  ~/projects ]; then
  echo 'Creating your local development structure. ~/projects'
  mkdir ~/projects
fi

# ==================================================
# Step 2: Install Apps, Tools and dotfiles
# ==================================================
echo "Installing GO"
curl https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash

echo "Installing brew and cask apps"
source ./brew.sh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".macos" \
		--exclude "bootstrap.sh" \
		--exclude "brew.sh" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "README.md" \
		-avh --no-perms . ~;
	source ~/.macos;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

# ==================================================
# Step 3: Github SSH and Global Config
# ==================================================
if [ ! -d ~/.ssh ]; then
  # SETUP SSH
  echo "Setting up SSH..."
  ssh-keygen -t rsa -b 4096 -C "$EMAIL"
fi

if [ -z $OUTFITTED ]; then
  #set git config values
  echo "Setting GIT config values..."

  echo "Setting global user name to $NAME"
  git config --global user.name "$NAME"

  echo "Setting global email to $EMAIL"
  git config --global user.email "$EMAIL"
fi

# ==================================================
# Step 4: Mac OS config and .zshrc
# ==================================================
source .macos
source .zshrc

echo "YOU MADE IT!!! Restart your computer and you'll be good to go. ::AIR GUITAR SOLO::"