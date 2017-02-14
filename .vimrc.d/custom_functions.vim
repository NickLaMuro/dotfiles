" Custom Functions
" ================

" http://stackoverflow.com/questions/2575545/vim-pipe-selected-text-to-shell-cmd-and-receive-output-on-vim-info-command-line
" Not sure if I will keep it or not
function PipeSelection() range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| pbcopy')
endfunction

" Show syntax highlighting groups for word under cursor
nmap <Leader><C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Bd - Delete buffer
"
" Same as the `bd` command, but doesn't remove the split
"
" http://stackoverflow.com/a/29179159
"
" command Bd  \| bd \#
command Bd call <SID>BuffDeleteAndReturnToLastBuff()

function! s:BuffDeleteAndReturnToLastBuff()
  exec "b #"
  exec "bd #"
endfunc


" Close open Quickfix windows
noremap <Leader>X :ccl <bar> lcl<CR>
