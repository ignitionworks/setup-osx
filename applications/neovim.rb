require 'applications/default'

desc 'Install neovim'
task 'application:neovim' => 'package_managers:homebrew' do
  system 'brew tap neovim/neovim'
  system 'brew install --HEAD neovim'
end
APPLICATIONS.push('neovim')
