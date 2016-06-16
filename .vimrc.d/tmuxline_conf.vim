" Tmux Line
" ---------

"let g:tmuxline_powerline_separators = 0


" Alternative Seperators
" ----------------------
" The following may display oddly with different fonts, but can be used to
" change up the seperator if the font used doesn't support the powerline
" character.

" Alternative Left Seperators  : ⮀',
" Alternative Right Seperators : ⮂',

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}
let g:tmuxline_preset = {
      \'a'       : '#(whoami)',
      \'b'       : '#S',
      \'c'       : '',
      \'win'     : '#I #W',
      \'cwin'    : '#I #W',
      \'x'       : '%a %Y-%m-%d %I:%M %p',
      \'y'       : '#(~/bin/battery Discharging) ',
      \'z'       : '#H',
      \'options' : {'status-justify' : 'left'}}
