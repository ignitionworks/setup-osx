desc 'Install Homebrew'
task 'package_managers:homebrew' do
  if system('command -v brew')
    system('brew update')
  else
    system('ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
  end
end

def brew(name_and_dependencies)
  app_name = name_and_dependencies.keys.first
  dependencies = name_and_dependencies[app_name] + ['package_managers:homebrew']
  desc "Install #{app_name}"
  task "application:#{app_name}" => dependencies do
    system "brew install #{app_name}"
  end
end
