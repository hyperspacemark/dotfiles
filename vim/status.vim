Plugin 'itchyny/lightline.vim'

set laststatus=2

let g:lightline = { 'colorscheme': 'wombat' }

let g:lightline.active = {
  \ 'right': [
  \   ['filetype']
  \ ]
\}

let g:lightline.inactive = { 'right': [ ] }
