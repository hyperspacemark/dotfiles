function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*.vim'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call plug#begin('~/.vim/plugged')
call s:SourceConfigFilesIn('plugins')
call plug#end()

call s:SourceConfigFilesIn('config')

command! ClearWhitespace call s:ClearWhitespace()
function! s:ClearWhitespace()
  let l:line = line('.')
  let l:column = col('.')
  keepjumps silent! %s/\s\+$//e
  call cursor(l:line, l:column)
  call histdel("search", -1)
endfunction

function! s:ClearWhitespaceIfExpected()
  if &ft =~? 'markdown'
    return
  endif

  call s:ClearWhitespace()
endfunction

augroup ft_settings
  autocmd!

  autocmd BufWritePre * call s:ClearWhitespaceIfExpected()
augroup END
