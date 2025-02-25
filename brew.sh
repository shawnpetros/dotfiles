#!/usr/bin/env bash

# exit on errors
set -e

error_exit() {
  echo "$1"
  exit 1
}

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Homebrew not found. Installing..."
  if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    echo "MacOS BOIEEE~~"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    # Linux
    echo "Linux dawgie dawg..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  else
    error_exit "Unsupported OS brah..."
  fi
else
  echo "Homebrew exists, we updating..."
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

# install brew apps
brew install $(cat brew-packages.txt)

# install casks
brew install --cask $(cat cask-packages.txt)

# Remove outdated versions from the cellar.
brew cleanup
