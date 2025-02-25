#!/usr/bin/env bash

# set up new mac...
mkdir -p ~/projects
git clone https://github.com/shawnpetros/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles
source bootstrap.sh
