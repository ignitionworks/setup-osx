desc 'Install Chruby'
task 'package_manager:chruby' => %w(
  package_manager:homebrew
  settings:bash_it
) do
  system 'brew install chruby'
  system 'brew install ruby-install'
  system 'bash -lc "bash-it enable plugin chruby-auto"'
end
