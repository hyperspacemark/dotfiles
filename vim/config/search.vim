" Default to global substitutions on lines
set gdefault

" Case-insensitive searching
set ignorecase

" Case-sensitive if expression contains capital letter
set smartcase

" Highlight matches
set hlsearch

" Show all matches
set showmatch

" Clear search highlighting on file open
autocmd BufReadCmd set nohlsearch

" Use The Silver Searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s --files-with-matches --hidden --nocolor -g ""'

  " ag is fast enough to get away with not caching CtrlP
  let g:ctrlp_use_caching = 0
endif
