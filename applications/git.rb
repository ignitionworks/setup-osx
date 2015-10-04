require 'applications/default'

desc 'Install git'
task 'application:git' => ['package_managers:homebrew_cask'] do
  system 'brew cask install git'
  system 'git config --global push.default simple'
  system 'git config --global pull.rebase true'
  system 'git config --global merge.conflictstyle diff3'
end
APPLICATIONS.push('git')
