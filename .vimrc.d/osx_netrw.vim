" Configure OSX to use `open` when using netrbrowsex
"
" This is currently broken on OSX because `has('mac')` only returns true for
" macvim users it seems.  This gets around the by forcing a override variable
" when on a OSX machine using a working method (even if it might be a hack).

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let g:netrw_browsex_viewer = "open"
  endif
endif
