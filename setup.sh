#!/usr/bin/env sh

# Install homebrew
if ! command -v brew > /dev/null 2>&1; then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is already available... skipping the installation"
  echo "Updating Homebrew..."
  brew update
fi

# Install Homebrew Cask
echo "Installing Homebrew Cask..."
brew install caskroom/cask/brew-cask

# Install chruby
echo "Installing chruby..."
brew install chruby

# Install bash-it
if [ ! -d ~/.bash_it ]; then
  echo "Installing bash-it..."
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
  ~/.bash_it/install.sh
else
  echo "Updating bash-it..."
  pushd ~/.bash_it
  git pull
  popd
fi
