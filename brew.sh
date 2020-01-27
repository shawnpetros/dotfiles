#!/usr/bin/env bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
# if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
#   echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
#   chsh -s "${BREW_PREFIX}/bin/bash";
# fi;

# Install `wget` with IRI support.
brew install wget

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh

# Install font tools.
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

# Install other useful binaries.
brew install ack
brew install git
brew install p7zip
brew install rename
brew install ssh-copy-id
brew install tree

# brew install docker
# brew install docker-machine
# brew install docker-compose
# might not need this
# brew install docker-credential-helper
brew install ispell
brew install kubernetes-cli
brew install make
# brew install node
brew install openssl
brew install postgresql
brew install python
brew install thefuck
brew install tmux
brew install zsh
brew install zsh-completions
brew install zsh-syntax-highlighting

# install casks
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" brave-browser
brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" emacs
brew cask install --appdir="/Applications" font-fira-code
brew cask install --appdir="/Applications" font-hack-nerd-font
brew cask install --appdir="/Applications" gpg-suite
brew cask install --appdir="/Applications" hyper
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" minikube
brew cask install --appdir="/Applications" spectacle
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" ngrok

# Remove outdated versions from the cellar.
brew cleanup
