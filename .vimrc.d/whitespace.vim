" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  if exists('b:whitespace') && !b:whitespace
    return
  endif
  " Preperation stuff: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Run the strip trailing command on file save for specific file types
autocmd FileType eruby,ruby,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
