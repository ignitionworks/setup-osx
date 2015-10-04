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
  git
  mongohub
  rubymine
  screenhero
  spectacle
  vlc
).each do |app_name|
  desc "Install #{app_name}"
  task "application:#{app_name}" => 'package_managers:homebrew_cask' do
    system "brew cask install #{app_name}"
  end

  APPLICATIONS.push(app_name)
end

%w(
  aws-cfn-tools
  s3cmd
).each do |app_name|
  desc "Install #{app_name}"
  task "application:#{app_name}" => 'package_managers:homebrew' do
    system "brew install #{app_name}"
  end

  APPLICATIONS.push(app_name)
end

desc 'Install postgresql'
task 'application:postgresql' => 'package_managers:homebrew' do
  system 'brew install postgresql'
  File.mkdir_p File.expand_path('~/Library/LaunchAgents')
  system('ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents')
  system('launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist')
end
APPLICATIONS.push('postgresql')

desc 'Install neovim'
task 'application:neovim' => 'package_managers:homebrew' do
  system 'brew tap neovim/neovim'
  system 'brew install --HEAD neovim'
end
APPLICATIONS.push('neovim')

desc 'Install atom'
task 'application:atom' => 'package_managers:homebrew_cask' do
  system 'brew cask install atom'
  %w(
    atom-alignment
    atom-html-preview
    circle-ci
    floobits
    git-plus
    language-SCSS
    language-ejs
    language-gherkin
    language-haml
    language-ruby
    language-svg
    lines
    linter
    linter-csslint
    linter-haml
    linter-htmlhint
    linter-js-yaml
    linter-jshint
    linter-rubocop
    linter-ruby
    linter-scss-lint
    rubocop-auto-correct
    ruby-test
    svg-preview
    whitespace
  ).each do |package|
    system "apm install #{package}"
  end
end
APPLICATIONS.push('atom')
