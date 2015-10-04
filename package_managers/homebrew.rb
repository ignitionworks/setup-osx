desc 'Install Homebrew'
task 'package_managers:homebrew' do
  if system('command -v brew')
    system('brew update')
  else
    system('ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
  end
end
