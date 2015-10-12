require 'applications/default'

desc 'Install atom'
task 'application:atom' => 'package_manager:homebrew_cask' do
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
  ).each do |package_name|
    next if File.exist?(File.expand_path("~/.atom/packages/#{package_name}"))
    system "apm install #{package}"
  end
end
APPLICATIONS.push('atom')
