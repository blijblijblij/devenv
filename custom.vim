" ================ Custom Settings ========================

" Window pane resizing
nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>

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
" Show hidden files in NERDtree
let NERDTreeShowHidden=1
set modifiable

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" For ruby block selections
runtime macros/matchit.vim

" autoformating
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:python3_host_prog="/usr/bin/python3"
" let g:autoformat_verbosemode=1
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

nnoremap <silent> <Leader>b :TagbarToggle<CR>

hi Normal guibg=NONE ctermbg=NONE

" include pry
nmap <leader>d :call pry#insert()<cr>

" include puts
nnoremap <Leader>pt oputs "#" * 60<C-M>puts "<C-R>=expand("%") . ':' . line(".")<CR>"<C-M>puts "*" * 60<esc>

" trigger rubocop
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" linting
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1 " Less distracting when opening a new file

" will let you search through your tags file and jump to where tags are defined
nnoremap <leader>. :CtrlPTag<cr>
