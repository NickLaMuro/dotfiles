" Airline
" -------

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

let g:airline#extensions#branch#enabled = 1
