augroup filetypes
  autocmd!

  " autocmd BufNewFile,BufRead Cartfile set filetype=carthage
  " autocmd BufNewFile,BufRead Cartfile.private set filetype=carthage
  " autocmd BufNewFile,BufRead Cartfile.resolved set filetype=carthage
  autocmd BufNewFile,BufRead Gemfile set filetype=ruby
  autocmd BufNewFile,BufRead Podfile set filetype=ruby
  autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END
