" Color scheme
colorscheme spacedust

" Status bar
let g:lightline = { 'colorscheme': 'wombat' }

let g:lightline.active = {
  \ 'right': [
  \   ['filetype'],
  \ ]
\}

let g:lightline.inactive = { 'right': [ ] }

set laststatus=2
set statusline+=%#warningmsg#
set statusline+=${SyntasticStatuslineFlag()}
set statusline+=%*

" Line numbers
set relativenumber
set number
