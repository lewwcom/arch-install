language en_US.utf8

syntax on

set number
set cursorline
set t_Co=16
hi clear CursorLine
hi clear CursorLineNR
" Comment the line below when using with vim for Windows
let g:lightline = { 'colorscheme': '16color' }

set laststatus=2
set noshowmode

set tabstop=4
set softtabstop=-1
set shiftwidth=0
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start
