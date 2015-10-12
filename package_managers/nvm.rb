desc 'Install nvm'
task 'package_managers:nvm' => 'settings:bash_it' do
  nvm_path = File.expand_path('~/.nvm')
  system("git clone https://github.com/creationix/nvm.git #{nvm_path}") unless File.exist?(nvm_path)
  Dir.chdir(nvm_path) do
    system('git checkout `git describe --abbrev=0 --tags`')
  end
  File.open(File.expand_path('~/.bash_it/custom/nvm.bash'), 'w') do |f|
    f.write("source #{nvm_path}/nvm.sh")
  end
end
