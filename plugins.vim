" ================ Plugin manager ====================
" Plug config
call plug#begin('~/.config/nvim/plugged')
  Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy file, buffer, mru, tag, etc finder
  Plug 'vim-scripts/bufexplorer.zip'
  Plug 'mileszs/ack.vim'                    " Search tool from Vim, with an enhanced results list.
  Plug 'preservim/nerdtree'                 " A tree explorer plugin for vim
  Plug 'Xuyuanp/nerdtree-git-plugin'        " A plugin of NERDTree showing git status flags
  Plug 'Chiel92/vim-autoformat'             " Format code
  Plug 'preservim/nerdcommenter'            " Comment functions
  Plug 'airblade/vim-gitgutter'           " A Vim plugin which shows a git diff in the 'gutter'
  Plug 'ervandew/supertab'                  " Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs
  Plug 'tpope/vim-commentary'               " Comment stuff out. Use gcc to comment out a line (takes a count)
  Plug 'tpope/vim-endwise'                  " This is a simple plugin that helps to end certain structures automatically
  " Plug 'tpope/vim-eunuch'                 " Vim sugar for the UNIX shell commands that need it the most
  Plug 'tpope/vim-sensible'                 " A universal set of defaults that (hopefully) everyone can agree on
  Plug 'tpope/vim-surround'                 " Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML tags, and more
  Plug 'tpope/vim-git'                      " Included are syntax, indent, and filetype plugin files for git, gitcommit, gitconfig, gitrebase, and gitsendemail
  Plug 'tpope/vim-fugitive'                 " may very well be the best Git wrapper of all time
  Plug 'tpope/vim-rhubarb'                  " If fugitive.vim is the Git, rhubarb.vim is the Hub
  Plug 'terryma/vim-multiple-cursors'
  " Ruby and Rails plugins
  Plug 'tpope/vim-rails'                    " This is a massive (in a good way) Vim plugin for editing Ruby on Rails applications
  Plug 'ngmy/vim-rubocop'                   " The Vim RuboCop plugin runs RuboCop and displays the results in Vim
  Plug 'BlakeWilliams/vim-pry'              " Insert pry statements quickly
  " var
  Plug 'benmills/vimux'                     " Easily interact with tmux from vim
  Plug 'w0rp/ale'                           " ALE (Asynchronous Lint Engine) is a plugin for providing linting
  Plug 'majutsushi/tagbar'                  " Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf is a general-purpose command-line fuzzy finder
  Plug 'junegunn/fzf.vim'                   " fzf runs asynchronously and can be orders of magnitude faster than similar Vim plugins
  Plug 'elzr/vim-json'                      " Distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing
  Plug 'stephpy/vim-yaml'                   " Syntax for yaml
  Plug 'cespare/vim-toml'                   " Syntac for toml
  Plug 'Raimondi/delimitMate'               " This plug-in provides automatic closing of quotes, parenthesis, brackets, etc
  " Javascript plugins
  Plug 'pangloss/vim-javascript'
  Plug 'mattn/emmet-vim' " autocomplete html
  " -------------------------------------------- REACT
  " https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
  " lint - https://drivy.engineering/setting-up-vim-for-react/
  " install locally
  "//--------------------------------------------
  Plug 'mxw/vim-jsx'
  "Code linting
  Plug 'skywind3000/asyncrun.vim'
  "IntelliSense
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} 
  " Themes
  Plug 'liuchengxu/space-vim-dark', { 'as': 'space-vim-dark'}
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'camspiers/animate.vim'              " automatically resizes windows when their content exceeds their window dimensions
  Plug 'camspiers/lens.vim'
  Plug 'wellle/context.vim'                 " plugin that shows the context of the currently visible buffer contents
call plug#end()
