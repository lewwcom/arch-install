syntax on

"===============================================================================
" Line number
" https://jeffkreeftmeijer.com/vim-number/
"===============================================================================
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

"===============================================================================
" Display
"===============================================================================
set colorcolumn=81
set cursorline
set t_Co=256
highlight clear CursorLine
highlight clear CursorLineNR
highlight LineNr ctermfg=grey

"===============================================================================
" lightline
"===============================================================================
let g:lightline = { 'colorscheme': 'Tomorrow_Night_Blue' }
set laststatus=2
set noshowmode

"===============================================================================
" Tab, indent and backspace
" https://gist.github.com/LunarLambda/4c444238fb364509b72cfb891979f1dd
"===============================================================================
set tabstop=4
set softtabstop=-1
set shiftwidth=0
set expandtab

set autoindent
set smartindent
set backspace=indent,eol,start

"===============================================================================
" Auto close brackets
"===============================================================================
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"===============================================================================
" Invisible characters
"===============================================================================
:set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

