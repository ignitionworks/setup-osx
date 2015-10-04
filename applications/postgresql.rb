require 'applications/default'

desc 'Install postgresql'
task 'application:postgresql' => 'package_managers:homebrew' do
  system 'brew install postgresql'
  require 'fileutils'
  FileUtils.mkdir_p File.expand_path('~/Library/LaunchAgents')
  system('ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents')
  system('launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist')
end
APPLICATIONS.push('postgresql')
