require 'package_managers/homebrew'
require 'package_managers/homebrew_cask'

APPLICATIONS = []

{
  '1password' => [],
  'bonjour-browser' => [],
  'caffeine' => [],
  'dash' => [],
  'dropbox' => [],
  'evernote' => [],
  'firefox' => [],
  'flux' => [],
  'flycut' => [],
  'google-chrome' => [],
  'java' => [],
  'little-snitch' => [],
  'mongohub' => [],
  'pepper-flash' => [],
  'pgadmin3' => [],
  'qtpass' => ['application:gnupg2'],
  'rdm' => [], # Redis Desktop Manager
  'rowanj-gitx' => [],
  'rubymine' => ['application:java6'],
  'screenhero' => [],
  'skype' => [],
  'slack' => [],
  'spectacle' => [],
  'vlc' => [],
  'xquartz' => []
}.each do |app_name, dependencies|
  brew_cask(app_name => dependencies)

  APPLICATIONS.push(app_name)
end

{
  'ag' => [],
  'apg' => [],
  'aws-elasticbeanstalk' => [],
  'pass' => [],
  'gnupg2' => [],
  'pstree' => [],
  's3cmd' => []
}.each do |app_name, dependencies|
  brew(app_name => dependencies)

  APPLICATIONS.push(app_name)
end

brew_cask('caskroom/homebrew-versions/java6' => [])
