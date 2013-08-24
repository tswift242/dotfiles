"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use vim settings instead of vi settings
set nocompatible

" Command/search history
set history=200

""" File types
" detect file type
filetype on
" load filetype plugins
filetype plugin on
" load file-specific indent files
filetype indent on

" Update file when modified elsewhere
set autoread

" Make , the map leader
let mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line numbers
set number

" Show current line number and column
set ruler

" Underline current line
set cursorline

" Makes backspace behavior more normal
set backspace=eol,start,indent

" Make h and l wrap to the left and right
set whichwrap+=h,l

" Height of the command bar (1 is default)
"set cmdheight=2

" Scroll when cursor is n lines from going offscreen
set scrolloff=4

" Enhanced tab autocompletion
set wildmenu
set wildmode=list:longest,full
set wildignore=*~,*.o,*.exe,*.class,*.pyc

" Incremental Search - start searching as soon as first character typed
set incsearch

" Ignore case when searching
set ignorecase

" Override ignorecase when search contains UC chars
set smartcase

" Highlight search results
set hlsearch

" Show matching brackets/parentheses
set showmatch

" Show partially completed commands
set showcmd

" Show current mode
set showmode

" Disable cursor blink in all modes -- NOT WORKING!!!
set guicursor=a:blinkon0

" Enable mouse
"set mouse=a

" Don't beep or flash screen upon error
set noerrorbells
set novisualbell


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

"colorscheme desert
set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups, swaps, and undos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Save undo history in file
" create ~/.vim/undo if it doesn't already exit and ignore all errors/output
silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
set undodir=~/.vim/undo
set undofile
set undolevels=100


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tabs, and indents
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" 1 tab = 4 spaces
" tabs stay tabs
set noexpandtab
" tabs represented as this many spaces (e.g. opening existing file with tabs)
set tabstop=4
" tab is this many spaces in insert mode
set softtabstop=4
" indent ops << and >> move text this many spaces
set shiftwidth=4

" Auto indent new lines
set autoindent
set smartindent

" Wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show status line
set laststatus=2

" Format the status line
set statusline=%t       "filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=\ %h      "help file flag: [help]
set statusline+=%m      "modified flag: [+]
set statusline+=%r      "read only flag: [RO]
set statusline+=\ Buffer:%n
set statusline+=\ \ CWD:%{getcwd()}		"current directory
set statusline+=%=      "left/right fields separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on spell checking
set spell


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii in insert mode
inoremap ii <ESC>`^

" Remap ^ and $ to ,j and ,k
nnoremap <leader>j ^ 
nnoremap <leader>k $ 

nnoremap <leader>l :ls<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

" edit and source vimrc (this file)
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions -- needed for statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
