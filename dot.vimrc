
syntax on
colorscheme koehler

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

if has("autocmd")
  filetype indent on
  filetype plugin on
endif

set autowrite	" Automatically save before commands like :next and :make
set hidden      " Hide buffers when they are abandoned
set ignorecase	" Do case insensitive matching
set incsearch	" Incremental search
set showcmd	" Show (partial) command in status line.
set showmatch	" Show matching brackets.
set smartcase	" Do smart case matching

set autoindent
set backspace=indent,eol,start
set hlsearch
set modeline
set ruler
set shiftwidth=8
set tabstop=8
setlocal omnifunc=syntaxcomplete#Complete

" Disable Python omni completion.
let g:AutoComplPop_BehaviorPythonOmniLength=-1

autocmd BufNewFile *.as 0r $HOME/.vim/templates/skeleton.as
autocmd BufNewFile *.py 0r $HOME/.vim/templates/skeleton.py
autocmd BufNewFile SConstruct 0r $HOME/.vim/templates/skeleton.py
autocmd BufNewFile SConscript 0r $HOME/.vim/templates/skeleton.py
autocmd BufNewFile Hanagami 0r $HOME/.vim/templates/skeleton.py
autocmd BufNewFile wscript 0r $HOME/.vim/templates/skeleton.py
autocmd BufNewFile *.rb 0r $HOME/.vim/templates/skeleton.rb
autocmd BufNewFile *.h 0r $HOME/.vim/templates/skeleton.h
autocmd BufNewFile *.c 0r $HOME/.vim/templates/skeleton.c
autocmd BufNewFile *.cpp 0r $HOME/.vim/templates/skeleton.cpp
autocmd BufNewFile *.cxx 0r $HOME/.vim/templates/skeleton.cpp
autocmd BufNewFile *.ml 0r $HOME/.vim/templates/skeleton.ml
autocmd BufNewFile *.mli 0r $HOME/.vim/templates/skeleton.ml
autocmd BufNewFile *.mll 0r $HOME/.vim/templates/skeleton.ml
autocmd BufNewFile *.mly 0r $HOME/.vim/templates/skeleton.ml
autocmd BufNewFile *.sml 0r $HOME/.vim/templates/skeleton.ml
autocmd BufNewFile *.yg 0r $HOME/.vim/templates/skeleton.yg
autocmd BufNewFile *.yog 0r $HOME/.vim/templates/skeleton.yg
autocmd BufNewFile *.h2yog 0r $HOME/.vim/templates/skeleton.h2yog
autocmd BufNewFile *.lua 0r $HOME/.vim/templates/skeleton.lua
autocmd BufNewFile *.rst 0r $HOME/.vim/templates/skeleton.rst
autocmd BufNewFile *.hs 0r $HOME/.vim/templates/skeleton.hs
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" For Gauche
autocmd FileType scheme :let is_gauche=1

set maxmempattern=2000000
