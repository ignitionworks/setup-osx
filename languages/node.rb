desc 'Setup node'
task 'languages:node' => 'package_managers:nvm' do
  system 'bash -lc "nvm install v0.12.7"'
  system 'bash -lc "nvm install v0.10.4"'
end
