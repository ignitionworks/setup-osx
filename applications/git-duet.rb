require 'applications/default'

desc 'Install git-duet'
task 'application:git_duet' => %w(
  application:git
  package_managers:homebrew
  settings:bash_it
) do
  require 'yaml'
  system 'brew tap git-duet/tap'
  system 'brew install git-duet'

  config = {
    'authors' => {
      'tc' => 'Theo Cushion; theo',
      'no' => 'Nadia Odunayo; nadia'
    },
    'email' => {
      'domain' => 'ignition.works'
    }
  }

  File.open(File.expand_path('~/.git-authors'), 'w').write(config.to_yaml)

  File.open(File.expand_path('~/.bash_it/custom/git_duet.bash'), 'w').write(
<<-EOS
export GIT_DUET_GLOBAL=true
export GIT_DUET_ROTATE_AUTHOR=true
EOS
  )
end
APPLICATIONS.push('git_duet')
