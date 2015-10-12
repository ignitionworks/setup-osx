desc 'Setup ruby'
task 'language:ruby' => 'package_manager:chruby' do
  unless File.exist?(File.expand_path('~/.rubies/ruby-2.2.3'))
    system 'ruby-install ruby 2.2.3'
  end
  File.open(File.expand_path('~/.ruby-version'), 'w').write('2.2.3')
  File.open(File.expand_path('~/.gemrc'), 'w').write('gem: --no-document')
end
