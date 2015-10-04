require 'applications/default'

desc 'Install git'
task 'application:git' => ['package_managers:homebrew_cask'] do
  system 'brew install git'
  system 'git config --global push.default simple'
  system 'git config --global pull.rebase true'
  system 'git config --global merge.conflictstyle diff3'
  system 'git config --global core.pager "/usr/local/share/git-core/contrib/diff-highlight/diff-highlight | less"'
  system 'git config --global color.ui true'
  system 'git config --global alias.ci "commit --verbose"'
  system 'git config --global alias.co "checkout"'
  system 'git config --global alias.dc "diff --staged"'
  system 'git config --global alias.lg "log --pretty=format:\'%C(yellow)%h%Creset %s %C(blue)<%an, %ar>%Creset\'"'
  system 'git config --global alias.lgg "log --graph --decorate --oneline"'
  system 'git config --global alias.st status'
end
APPLICATIONS.push('git')
