desc 'Install nvm'
task 'package_managers:nvm' => 'settings:bash_it' do
  system('bash -lc "bash-it enable plugin nvm"')
end
