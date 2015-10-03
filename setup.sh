#!/usr/bin/env bash -xe

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
brew cask search
brew cask install google-chrome
brew cask install skype
brew cask install slack
brew cask install atom

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

# Setup osx defaults

# Show icons for servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Setup terminal to use Homebrew
defaults write ~/Library/Preferences/com.apple.Terminal.plist "Default Window Settings" "Homebrew"
defaults write ~/Library/Preferences/com.apple.Terminal.plist "Startup Window Settings" "Homebrew"

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0
