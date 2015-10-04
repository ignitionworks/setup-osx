desc 'Setup bash-it'
task 'settings:bash_it' do
  bash_it_path = File.expand_path('~/.bash_it')
  if File.exist?(bash_it_path)
    Dir.chdir(bash_it_path) { system('git pull') }
  else
    system("git clone --depth=1 https://github.com/Bash-it/bash-it.git #{bash_it_path}")
    system(File.join(bash_it_path, 'install.sh'))
  end
end
