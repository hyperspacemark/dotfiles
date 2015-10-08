" Use The Silver Searcher
if executable('ag')
  "Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for finding files. Fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --files-with-matches --hidden --nocolor -g "" '

  " ag is fsat enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

augroup search
  autocmd!

  autocmd QuickFixCmdPost *grep* cwindow
augroup END

" Search silently
command -nargs=+ -complete=file -bar Gr silent! grep! <args> | redraw!

" Map Gr to \
nnoremap \ :Gr<SPACE>

" Bind K to grep word under cursor
nnoremap K :Gr <C-R><C-W><CR>
