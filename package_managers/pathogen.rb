task 'package_managers:pathogen' do
  system 'mkdir -p ~/.nvim/autoload'
  system 'mkdir -p ~/.nvim/bundle'
  system 'curl -LSso ~/.nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim'
end
