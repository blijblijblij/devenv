" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" source ~/.vimrc.before if it exists.

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
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()
" ================ General Config ====================

set number relativenumber       "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set splitbelow                  "horizontally split below
set splitright                  "vertical split right

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","
set timeout timeoutlen=1500

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Custom Settings ========================

" Window pane resizing
nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>

" ===== Seeing Is Believing =====
" " Assumes you have a Ruby with SiB available in the PATH
" " If it doesn't work, you may need to `gem install seeing_is_believing -v
" 3.0.0.beta.6`
" " ...yeah, current release is a beta, which won't auto-install
"
" " Annotate every line
"
nmap <leader>b :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;
"  " Annotate marked lines
"
nmap <leader>n :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;
"  " Remove annotations
"
nmap <leader>c :%.!seeing_is_believing --clean<CR>;
"
"  " Mark the current line for annotation
nmap <leader>m A # => <Esc>
"
"  " Mark the highlighted lines for annotation
vmap <leader>m :norm A # => <Esc>

" NerdTree settings
" open and close NerdTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
" Open Nerdtree by default
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" automatically close NerdTree when you open a file<Paste>
let NERDTreeQuitOnOpen = 0
" Automatically delete the buffer of the file you just deleted with NerdTree 
let NERDTreeAutoDeleteBuffer = 1
" making it prettier
let g:NERDTreeWinSize = 60
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
set modifiable

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" For ruby block selections
runtime macros/matchit.vim

" Move line down and up
noremap <Leader>- :m .+1<CR>
noremap <Leader>= :m .-2<CR>

" Uppercase converter for insert and normal mode
vnoremap <c-u> U

" Open up vimrc in new pane
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source new changes
nnoremap <leader>sv :source $MYVIMRC<cr>

" Show hidden files in NERDtree
let NERDTreeShowHidden=1

" set colors
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
    hi Comment cterm=italic
  endif
endif

set background=dark

" space vim dark
colorscheme space-vim-dark
let g:airline_theme='violet'
let g:space_vim_dark_background = 234
set termguicolors
hi LineNr ctermbg=NONE guibg=NONE

" colorscheme neodark
" let g:neodark#use_256color = 1 " default: 0
" let g:neodark#terminal_transparent = 1 " default: 0
" let g:neodark#solid_vertsplit = 1 " default: 0
" let g:lightline = {}
" let g:lightline.colorscheme = 'neodark'

" autoformating
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:python3_host_prog="/usr/bin/python3"
" let g:autoformat_verbosemode=1
" noremap <F3> :Autoformat<CR>
nmap <Leader>a :Autoformat<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'right'
"
" " Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ignore
set wildignore+=*/node_modules/*,*/tmp/*

nmap <F8> :TagbarToggle<CR>

hi Normal guibg=NONE ctermbg=NONE

" include pry
nmap <leader>d :call pry#insert()<cr>

" include puts
nnoremap <Leader>pt oputs "#" * 60<C-M>puts "<C-R>=expand("%") . ':' . line(".")<CR>"<C-M>puts "*" * 60<esc>
set mouse=a

" trigger rubocop
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" linting
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1 " Less distracting when opening a new file
