set nocompatible

" Command/search history
set history=100

" keep undo history in file
" set undodir <directory>
set undofile
set undolevels=100

" Update file when modified elsewhere
set autoread

" Make ',' a map leader
let mapleader = ","

" Show line numbers
set number

" Show current line number and column
set ruler

" Underline current line
set cursorline

" Turn on spell checking
set spell

" Makes backspace more 'normal'
set backspace=eol,start,indent

" Scroll when cursor is n lines from going offscreen
set scrolloff=4

" Enhanced tab autocompletion
set wildmenu
set wildmode=list:longest
set wildignore=*~,*.o,*.exe,*.class

" Start searching as soon as first character typed
set incsearch

" Ignore case when searching
set ignorecase

" Override ignorecase when search contains UC chars
set smartcase

" Highlight search results
set hlsearch

" Show matching brackets/parentheses
set showmatch

" Enable syntax highlighting
syntax enable

set background=dark

" 1 tab = 4 spaces
set shiftwidth=4

" Auto indent new lines
set autoindent
set smartindent

" Wrap lines
set wrap

" Show partially completed commands
set showcmd

" Show current mode
set showmode

" Remap ESC to ii in insert mode
inoremap ii <ESC>`^

" Remap ^ and $ to ,j and ,k
nnoremap <leader>j ^ 
nnoremap <leader>k $ 
nnoremap <leader>l :ls<CR>
nnoremap <leader>n :bn<CR>
