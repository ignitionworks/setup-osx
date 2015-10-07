require 'applications/default'

desc 'Install neovim'
task 'application:neovim' => %w(
  application:ag
  package_managers:homebrew
  package_managers:pathogen
) do
  system 'brew tap neovim/neovim'
  system 'brew install --HEAD neovim'

  File.open(File.expand_path('~/.nvimrc'), 'w').write(neovim_config)

  bundle_directory = File.expand_path('~/.nvim/bundle')
  %w(
    https://github.com/kien/ctrlp.vim.git
    https://github.com/rking/ag.vim.git
    https://github.com/scrooloose/nerdtree.git
    https://github.com/tpope/vim-commentary.git
    https://github.com/tpope/vim-endwise.git
    https://github.com/thoughtbot/vim-rspec.git
  ).each do |vim_package_url|
    name = File.basename(vim_package_url, '.git')
    path = File.join(bundle_directory, name)
    if File.exist?(path)
      Dir.chdir(path) { system 'git pull' }
    else
      system "git clone #{vim_package_url} #{path}"
    end
  end
end
APPLICATIONS.push('neovim')

def neovim_config
  <<-EOS
set nocompatible
execute pathogen#infect()
syntax enable

" colorscheme solarized
" set background=dark

set backspace=indent,eol,start
set spell
set history=50
set mouse=a

set ruler
set showcmd
set incsearch
set number

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set ignorecase

set splitbelow
set splitright

set encoding=utf-8
set fileencoding=utf-8
set noswapfile
set nobackup
set nowritebackup

set colorcolumn=110

au BufRead,BufNewFile *.md set filetype=markdown

" Don't use Ex mode, use Q for formatting
map Q gq

map <silent> <C-n> :NERDTreeToggle<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch between panes more easily
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
syntax on
set hlsearch
endif

if has("autocmd")
filetype plugin indent on

augroup vimrcEx
au!
autocmd FileType text setlocal textwidth=78
autocmd BufReadPost *
  \\ if line("'\\"") > 1 && line("'\\"") <= line("$") |
  \\   exe "normal! g`\\"" |
  \\ endif
augroup END

else
set autoindent		" always set autoindenting on
endif " has("autocmd")

if !exists(":DiffOrig")
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \\ | wincmd p | diffthis
endif

nnoremap ; :
EOS
end
