set nocompatible
filetype off

" Vundle Begin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

for file in split(globpath('$DOTFILES/vim', '*.vim'), '\n')
  exec 'source' file
endfor

call vundle#end()

" Enable syntax highlighting
syntax enable

" Enable file type detection
filetype plugin indent on

" Color scheme
colorscheme spacedust

set backspace=indent,eol,start

set showcmd
set hidden
set wildmenu
set wildmode=list:longest

set gdefault

set visualbell

set nobackup
set nowritebackup
set noswapfile

set tabstop=2
set shiftwidth=2
set expandtab

set ignorecase
set smartcase

set incsearch
set hlsearch
set showmatch

set relativenumber
set cursorline

set wrap
set scrolloff=3

set title

set list listchars=tab:»·,trail:·

set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

let &t_SI = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
