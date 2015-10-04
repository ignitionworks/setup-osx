require 'package_managers/homebrew'
require 'package_managers/homebrew_cask'

APPLICATIONS = []

{
  'google-chrome' => [],
  'skype' => [],
  'slack' => [],
  'xquartz' => [],
  'bonjour-browser' => [],
  'dash' => [],
  'dropbox' => [],
  'evernote' => [],
  'flux' => [],
  'flycut' => [],
  'mongohub' => [],
  'rubymine' => ['application:java6'],
  'screenhero' => [],
  'spectacle' => [],
  'rowanj-gitx' => [],
  'vlc' => [],
  'java' => [],
  'pepper-flash' => []
}.each do |app_name, dependencies|
  brew_cask(app_name => dependencies)

  APPLICATIONS.push(app_name)
end

{
  'ag' => [],
  's3cmd' => [],
  'aws-cfn-tools' => ['application:java'],
  'pstree' => []
}.each do |app_name, dependencies|
  brew(app_name => dependencies)

  APPLICATIONS.push(app_name)
end

brew_cask('caskroom/homebrew-versions/java6' => [])
