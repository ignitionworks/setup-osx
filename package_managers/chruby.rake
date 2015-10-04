desc 'Install Chruby'
task 'package_managers:chruby' => %w(
  package_managers:homebrew
  settings:bash_it
) do
  system 'brew install chruby'
  system 'brew install ruby-install'
  system 'bash -l "bash_it enable chruby-auto"'
end
