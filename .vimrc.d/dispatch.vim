" Configuration and keymaps for vim-dispatch

let g:dispatch_rspec_possible_commands = ['rspec', 'zeus test']
let g:dispatch_test_unit_possible_commands = ['ruby -I test', 'testdrb -I test', 'zeus test']
let g:dispatch_current_test_unit_command = 0
let g:dispatch_current_rspec_command = 0
let g:dispatch_command_rspec = g:dispatch_rspec_possible_commands[0]
let g:dispatch_command_test_unit = g:dispatch_test_unit_possible_commands[0]

nmap <Leader>t :call <SID>ToggleDispatchTestFrameworkCommand()<CR>
function! s:ToggleDispatchTestFrameworkCommand()
  for test_framework in ['rspec', 'test_unit']
    exec "let current_index = g:dispatch_current_".test_framework."_command"
    exec "let new_index = (current_index + 1) % len(g:dispatch_".test_framework."_possible_commands)"
    exec "let g:dispatch_command_".test_framework." = g:dispatch_".test_framework."_possible_commands[new_index]"
    exec "let g:dispatch_current_".test_framework."_command = new_index"
  endfor

  let test_file_type = index(split(globpath('.', '*'), '\n'), './spec') > 0 ? 'RSpec' : 'Test Unit'
  let test_cmd = "g:dispatch_command_".tolower(substitute(test_file_type,' ','_','g'))
  exec "let b:dispatch = ".test_cmd.".' %'"
  exec "echo '".test_file_type." is now being run with \"'".test_cmd."'\"'"
  " exec "echo '".test_file_type." is now being run with \"'.g:turbux_command_".tolower(substitute(test_file_type,' ','_','g')).".'\"'"
endfunction

autocmd BufEnter *_spec.rb let b:dispatch = g:dispatch_command_rspec.' %'
autocmd BufEnter *_test.rb let b:dispatch = g:dispatch_command_test_unit.' %'


nnoremap <Leader>r :Dispatch<CR>
