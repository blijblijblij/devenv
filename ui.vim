" ================ Ui Settings ========================

" set colors
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
    hi Comment cterm=italic
    hi LineNr ctermbg=NONE guibg=NONE
  endif
endif

set background=dark

" space vim dark
" colorscheme space-vim-dark
" let g:airline_theme='violet'
" let g:space_vim_dark_background = 234

colorscheme neodark
let g:neodark#use_256color = 1 " default: 0
let g:neodark#terminal_transparent = 1 " default: 0
let g:neodark#solid_vertsplit = 1 " default: 0
let g:lightline = {}
let g:lightline.colorscheme = 'neodark'

