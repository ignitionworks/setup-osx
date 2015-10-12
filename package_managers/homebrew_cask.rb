task 'package_manager:homebrew_cask' => %w(
  package_manager:homebrew
  settings:bash_it
) do
  config = "export HOMEBREW_CASK_OPTS='--appdir=/Applications'"
  File.open(File.expand_path('~/.bash_it/custom/homebrew_cask.bash'), 'w').write(config)
  system('brew install caskroom/cask/brew-cask')
  system('brew cask search > /dev/null')
end

def brew_cask(name_and_dependencies)
  full_app_name = name_and_dependencies.keys.first
  app_name = full_app_name.split('/').last
  dependencies = name_and_dependencies.fetch(full_app_name) + ['package_manager:homebrew_cask']
  desc "Install #{app_name}"
  task "application:#{app_name}" => dependencies do
    system "brew cask install --appdir=/Applications #{full_app_name}"
  end
end
