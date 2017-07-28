" vimgrep/ack.vim/unite.vim shortcuts
"
" Most of these mappings have been converted to work for unite.vim, but the
" original vimgrep and ack.vim mappings are commented here for use later


" Shortcut for starting a 'find in project' search
"
" nmap <Leader><C-f> :Ack "
" nmap <Leader><C-f> :vimgrep 
" nmap <Leader><C-f> :Unite grep:.<CR>
nmap <Leader><C-f> :call <SID>UniteSearch()<CR>

function! s:UniteSearch(...)
  exec ":Unite grep:."
endfunction

" Mappings

" start a Ctrl-p like search using unite.vim
nnoremap <C-p> :Unite -start-insert file_rec/async:!<CR>
" nnoremap <C-p> :Unite -start-insert file_rec/async<CR>

" search
nnoremap <leader>Y :<C-u>Unite -no-split -buffer-name=yank    history/yank<CR>
nnoremap <leader>E :<C-u>Unite -no-split -buffer-name=buffer  buffer<CR>

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Open unite.vim windows on the bottom of the screen
call unite#custom#profile('default', 'context', {
     \   'direction': 'botright',
     \   'winheight': 10
     \ })

" Taken from https://github.com/bling/dotvim/blob/dfc2f28/vimrc#L576-L584
"
" Modified to make it togglable

let g:possible_grep_commands = ['default']

if executable('ag')
  let g:possible_grep_commands = g:possible_grep_commands + ['ag']
  let g:ag_unite_source_grep_command = 'ag'
  let g:ag_unite_source_grep_default_opts = '--nocolor --line-numbers --nogroup -S -C4'
endif
if executable('ack')
  let g:possible_grep_commands = g:possible_grep_commands + ['ack']
  let g:ack_unite_source_grep_command = 'ack'
  let g:ack_unite_source_grep_default_opts = '--no-heading --no-color -C4 --type-set=LOG=.log --noLOG'
endif
if executable('git')
  let g:possible_grep_commands = g:possible_grep_commands + ['git']
  let g:git_unite_source_grep_command = 'git'
  let g:git_unite_source_grep_default_opts = 'grep -n --no-color'
endif

let g:current_grep_command = 0
" echo join(g:possible_grep_commands, ' ')

nmap <Leader>f :call <SID>ToggleUniteSearchCommand()<CR>

" Start with the default grep, and switch on execution of the Toggle command.
" Report back to the user with the current command being used
function! s:ToggleUniteSearchCommand()
  let g:current_grep_command = (g:current_grep_command + 1) % len(g:possible_grep_commands)
  let grep_cmd = g:possible_grep_commands[g:current_grep_command]

  if grep_cmd ==# 'default'
    unlet! g:unite_source_grep_command
    unlet! g:unite_source_grep_default_opts
    unlet! g:unite_source_grep_recursive_opt
  else
    exec "let g:unite_source_grep_command = g:".grep_cmd."_unite_source_grep_command"
    exec "let g:unite_source_grep_default_opts = g:".grep_cmd."_unite_source_grep_default_opts"
    exec "let g:unite_source_grep_recursive_opt = ''"
  endif
  exec "echo 'Unite Search is now being run with ".grep_cmd.".'"
endfunction
