task 'package_managers:homebrew_cask' => 'package_managers:homebrew' do
  system('brew install caskroom/cask/brew-cask')
  system('brew cask search > /dev/null')
end
