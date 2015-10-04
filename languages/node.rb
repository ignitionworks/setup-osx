desc 'Setup node'
task 'language:node' => 'package_managers:nvm' do
  system 'bash -lc "nvm install v0.12.7"'
  system 'bash -lc "nvm install v0.10.4"'
  File.open(File.expand_path('~/.nvmrc'), 'w').write('0.12.7')
end
