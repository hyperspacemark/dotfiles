set nocompatible
syntax enable
filetype plugin indent on
colorscheme Spacedust

set backspace=indent,eol,start

set tabstop=2
set shiftwidth=2
set expandtab
set number
set title
set laststatus=2
set textwidth=80
set relativenumber
set mouse=a
set ttyfast
set timeout
set timeoutlen=1000
set ttimeoutlen=100

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

autocmd BufNewFile,BufRead Podfile setfiletype ruby
autocmd BufRead gitcommit setlocal formatoptions-=c
