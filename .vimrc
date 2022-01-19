set termguicolors
colorscheme monokai_pro
syntax on

set cursorline
set number

let g:lightline = { 'colorscheme': 'monokai_pro' }
set laststatus=2
set noshowmode

set tabstop=4
set softtabstop=-1
set shiftwidth=0
set expandtab
set autoindent
set smartindent

hi Normal guibg=NONE
hi NonText guifg=#FF9B5E guibg=NONE
hi LineNr guifg=#FF9B5E guibg=NONE
hi clear CursorLine
hi clear CursorLineNr
