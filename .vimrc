call pathogen#helptags()
call pathogen#runtime_prepend_subdirectories(expand('<sfile>:h').'/.vim/bundles')

" Add `hub pull-request` syntax highlighting to vim, if installed via homebrew
"
" TODO:  Support other platforms
if isdirectory('/usr/local/share/vim')
  call pathogen#runtime_prepend_subdirectories('/usr/local/share/vim')
endif

"These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Windows Compatible
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier. 
"if has('win32') || has('win64')
  "set runtimepath=$VIMRUNTIME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
"endif


if has("win32") || has("win16")
  set term=xterm
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif

set t_Co=256

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
filetype plugin on
"helptags ~/.vim/doc

" Enable syntax highlighting
colorscheme NVL_twilight
syntax on

"------------------------------------------------------------
" Swap file settings
"
set directory^=$HOME/.vim_swap//   "put all swap files together in one place


"------------------------------------------------------------
" Must have options
"
" These are highly recommended options.

set cursorline

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" set nomodeline
set modelines=5

" Set up folding options
"set foldmethod=syntax
"autocmd BufEnter * exe "normal zR"

"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set vb t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Open new splits on the right instead of the left (default)
set splitright

"------------------------------------------------------------
" Indentation options
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set shiftwidth=2
set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

let mapleader = ";"

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" NERDTree and buffer shorcuts
nmap <F3> :bp<CR>
nmap <F4> :bn<CR>
nmap <F5> :NERDTreeToggle<CR>

" PuTTY friendly versions of the above
nmap <C-\> :NERDTreeToggle<CR>
"nmap <C-[> :bp<CR>
"nmap <C-]> :bn<CR>

" PageUp/PageDown... but easier
map <C-j> <C-f>
map <C-k> <C-b>
"map <PageUp> <C-k>
"map <PageDown> <C-j>

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


" Bufferline
" ----------

let g:airline#extensions#bufferline#enabled = 0
let g:bufferline_echo = 0

" MiniBufExpl
" -----------

let g:miniBufExplorerAutoStart = 0

" For mail:  ✉, ⚄, ☒, ⏘ , ⏏ , ⍌
"

autocmd BufNewFile,BufReadPost *.*.coffee set filetype=coffee
autocmd BufNewFile,BufReadPost *.vsh set filetype=c
autocmd BufNewFile,BufReadPost *.fsh set filetype=c
autocmd BufNewFile,BufReadPost *.qss set filetype=css

autocmd BufNewFile,BufReadPost Guardfile set filetype=ruby
autocmd BufNewFile,BufReadPost Gemfile set filetype=ruby
autocmd BufNewFile,BufReadPost Vagrantfile set filetype=ruby
autocmd BufNewFile,BufReadPost Berksfile set filetype=ruby
autocmd BufNewFile,BufReadPost *.ru set filetype=ruby

autocmd Filetype *.c set tabstop=8
autocmd Filetype *.h set tabstop=8

"------------------------------------------------------------
" Load Plugin Files

let dir_name = expand('<sfile>:p:h')
for plugin_file in split(globpath(dir_name, '.vimrc.d/*'), '\n')
  execute 'source' plugin_file
endfor
