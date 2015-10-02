#!/usr/bin/env sh

# Install homebrew
if ! command -v brew > /dev/null 2>&1; then
  echo "Okay, lets do this. First things first, we need to install homebrew in order to get all the stuff you need"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew was already available... skipping the installation"
  echo "Let's update it instead! (you know you haven't updated in a while)"
  brew update
fi

# Install Brew Cask
brew install caskroom/cask/brew-cask

# Install chruby
brew install chruby

# Install bash-it
brew install bash-it
