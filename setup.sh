#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.33.0
nvm use v0.33.0

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

## NOT USING EMACS
# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
#sudo apt-add-repository -y ppa:cassou/emacs
#sudo apt-get update
#sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi

if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi

git clone https://github.com/ajvill/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
#ln -sf dotfiles/.emacs.d .

## Install Ruby RVM system
\curl -L https://get.rvm.io | bash -s stable
