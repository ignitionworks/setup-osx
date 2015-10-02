#!/bin/bash -xe

# Install homebrew
hash brew 2>/dev/null || { ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" }

# Install Brew Cask
brew install caskroom/cask/brew-cask

# Install chruby
brew install chruby

# Install bash-it
brew install bash-it
