#!/usr/bin/env bash

# set up new mac...
mkdir -p ~/projects
git clone https://github.com/shawnpetros/dotfiles.git ~/projects/dotfiles
ln -s ~/projects/dotfiles ~/dotfiles
cd ~/dotfiles
echo "LOOK'S GOOD"
