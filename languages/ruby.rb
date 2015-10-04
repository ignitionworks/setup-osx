desc 'Setup ruby'
task 'languages:ruby' => 'package_managers:chruby' do
  system 'chruby install ruby 2.2.3'
end
