" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" NERDTree and buffer shorcuts
nmap <F3> :bp<CR>
nmap <F4> :bn<CR>
nmap <F5> :NERDTreeToggle<CR>

" PuTTY friendly versions of the above
nmap <C-\> :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-[> :bp<CR>
nmap <C-]> :bn<CR>
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>

" Tabs
"nmap <Leader>tt :tabnew<CR>
"nmap <F11> :tabp<CR>
"nmap <F12> :tabn<CR>
"nmap <Leader>tw :bd<CR>
"nmap <leader>tb :tabfirst<CR>
"nmap <leader>tb :tablast<CR>

" Rails.vim shortcuts
nmap <Leader><C-R>m :Rmodel<CR>
nmap <Leader><C-R>v :Rview<CR>
nmap <Leader><C-R>c :Rcontroller<CR>
nmap <Leader><C-R>a :A<CR>
nmap <Leader><C-R>r :R<CR>


