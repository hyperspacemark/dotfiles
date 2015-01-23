set nocompatible
syntax enable
filetype plugin indent on
set background=dark
colorscheme solarized

set backspace=indent,eol,start

set tabstop=2
set shiftwidth=2
set expandtab
set number
set title
set laststatus=2
set textwidth=80
set colorcolumn=1

autocmd BufNewFile,BufRead Podfile setfiletype ruby
autocmd BufRead gitcommit setlocal formatoptions-=c
