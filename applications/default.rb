APPLICATIONS = []

%w(
  google-chrome
  skype
  slack
  xquartz
  bonjour-browser
  dash
  dropbox
  evernote
  flux
  flycut
  mongohub
  rubymine
  screenhero
  spectacle
  rowanj-gitx
  vlc
  java
).each do |app_name|
  desc "Install #{app_name}"
  task "application:#{app_name}" => 'package_managers:homebrew_cask' do
    system "brew cask install #{app_name}"
  end

  APPLICATIONS.push(app_name)
end

%w(
  ag
  s3cmd
).each do |app_name|
  desc "Install #{app_name}"
  task "application:#{app_name}" => 'package_managers:homebrew' do
    system "brew install #{app_name}"
  end

  APPLICATIONS.push(app_name)
end

desc 'Install aws-cfn-tools'
task 'application:aws-cfn-tools' => 'application:java' do
  system 'brew install aws-cfn-tools'
end
