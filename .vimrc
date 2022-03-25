language en_US.utf8

if has("termguicolors")
    set termguicolors
endif

let g:sonokai_style="espresso"
let g:sonokai_better_performance=1
let g:sonokai_enable_italic=1
let g:sonokai_transparent_background=1
colorscheme sonokai
syntax on

set number
set cursorline

let g:lightline={"colorscheme":"sonokai"}
set laststatus=2
set noshowmode

set tabstop=4
set softtabstop=-1
set shiftwidth=0
set expandtab
set autoindent
set smartindent

