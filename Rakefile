$LOAD_PATH.unshift(__dir__)
Dir.glob(File.join(__dir__, '**', '*.rake')).each do |rake_file|
  load rake_file
end

task default: [
  'settings:osx',
  'settings:bash_it',
  'languages:ruby'
] + APPLICATIONS.map { |name| "application:#{name}" }
