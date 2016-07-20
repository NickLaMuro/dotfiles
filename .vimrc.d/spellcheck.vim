" Spell Checking
" --------------
"
" A lot of ideas for these settings come from the following article:
"
"   https://robots.thoughtbot.com/vim-spell-checking
"
" Because supertab is included as a plugin with this setup, auto-complete of
" partially completed dictionary words can accomplished by pressing TAB in
" insert mode
"
" Hotkey reference:
"
"   - To cycle though mispelled words, use `]s` and `[s` to move to the next
"     and previously mispelled words respectively.




" private: Check if spell check is on.
"
"   - If it isn't: turn it on and enable autocomplete of words
"   - If it is:    turn it off and remote dictionary autocomplete
"
function! s:Spellcheck()
  if &l:spell == 0
    setlocal spell
    setlocal complete+=kspell
  else
    setlocal nospell
    
    " Since 'complete' is a comma delimited string, we need to convert it to
    " an array first, remove the kspell element, and reset the variable as a
    " comma delimited string
    let l:complete_as_list = split(&l:complete, ',')
    call remove(l:complete_as_list, index(l:complete_as_list, 'kspell'))
    let &l:complete = join(l:complete_as_list, ',')
  endif
endfunction

" Trigger s:Spellcheck() by typing :Spellcheck
command Spellcheck call <SID>Spellcheck()

" Trigger s:Spellcheck() on specific filetypes
"
"   - Markdown files
"   - git commits
autocmd BufRead,BufNewFile *.md call <SID>Spellcheck()
autocmd FileType gitcommit call <SID>Spellcheck()
