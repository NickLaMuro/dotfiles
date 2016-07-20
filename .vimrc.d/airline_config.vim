" Airline
" -------
"
" A decent amount of this file contains alternative characters to use if you
" are using a old powerline font, or not one at all.

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" seperator characters
" --------------------
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '❱'
"let g:airline_left_sep = '▊►'
"let g:airline_right_sep = '«'
"let g:airline_left_sep = '►'
let g:airline_left_sep = ''
"let g:airline_left_sep = '⮀'
"let g:airline_right_sep = '◀'
let g:airline_right_sep = ''
"let g:airline_right_sep = '⮂'


let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.branch = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


command AirlineToggleBranch call <SID>AirlineToggleBranch()
function! s:AirlineToggleBranch()
  if g:airline_section_b == ''
    let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
  else
    let g:airline_section_b = ''
  endif
  AirlineRefresh
endfunction
