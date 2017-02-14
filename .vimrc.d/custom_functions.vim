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

" Move up and down the previous quickfix without changing window context
" nmap _ L 3j 0 <C-w><C-p>
" nmap + H 3k 0 <C-w><C-p>
" nmap _ :cope <bar> normal L 3j 0 <C-w><C-p>
nmap _ :call <SID>MoveQuickfixDown()<CR>
" nmap + :cope <bar> normal H 3k 0 <C-w><C-p>
nmap + :call <SID>MoveQuickfixUp()<CR>

" Idea that needs some work to handle quickfix state
" function! <SID>MoveQuickfixDown()
"   exec "cope 10"
"   exec "if !exists('w:qf_line_num') | let w:qf_line_num = 0 | endif"
"   exec "let w:qf_line_num = w:qf_line_num + 3"
"   exec "normal L"
"   exec "normal ".."j"
"   exec "normal 0"
"   exec "normal \<C-w>\<C-p>"
" endfunc


" Potential ideas for fixing
" http://vim.1045645.n5.nabble.com/how-to-get-list-of-open-windows-td1164662.html

" FIXME:  Doesn't handle multiple splits well, since it is assumes the
" quickfix was the last window used
function! <SID>MoveQuickfixDown()
  exec "normal \<C-w>\<C-p>"
  exec "normal L"
  exec "normal 3j"
  exec "normal 0"
  exec "normal \<C-w>\<C-p>"
endfunc

" FIXME:  Doesn't handle multiple splits well, since it is assumes the
" quickfix was the last window used
function! <SID>MoveQuickfixUp()
  exec "normal \<C-w>\<C-p>"
  exec "normal H"
  exec "normal 3k"
  exec "normal 0"
  exec "normal \<C-w>\<C-p>"
endfunc
