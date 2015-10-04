desc 'Setup OSX'
task 'settings:osx' do
  # Show icons for servers, and removable media on the desktop
  system('defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true')
  system('defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false')
  system('defaults write com.apple.finder ShowMountedServersOnDesktop -bool true')
  system('defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true')

  # Avoid creating .DS_Store files on network volumes
  system('defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true')

  # Enable AirDrop over Ethernet and on unsupported Macs running Lion
  system('defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true')

  # Disable Dashboard
  system('defaults write com.apple.dashboard mcx-disabled -bool true')

  # Don’t show Dashboard as a Space
  system('defaults write com.apple.dock dashboard-in-overlay -bool true')

  # Automatically hide and show the Dock
  system('defaults write com.apple.dock autohide -bool true')

  # Prevent Time Machine from prompting to use new hard drives as backup volume
  system('defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true')

  # Setup terminal to use Homebrew
  system('defaults write ~/Library/Preferences/com.apple.Terminal.plist "Default Window Settings" "Homebrew"')
  system('defaults write ~/Library/Preferences/com.apple.Terminal.plist "Startup Window Settings" "Homebrew"')

  # Set a blazingly fast keyboard repeat rate
  system('defaults write NSGlobalDomain KeyRepeat -int 0')
end
