" use vim settings instead of vi settings
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :BundleList		- list bundles
" :BundleInstall	- install/update bundles
" :BundleClean		- remove bundles
" :BundleSearch		- search for bundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vundle for first time if necessary
if !isdirectory(expand("~/.vim/bundle/vundle"))
	!mkdir -p ~/.vim/bundle
	!git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	let s:bootstrap=1 "indicates vundle needed to be installed
endif


filetype off "required

" setup Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

""""" My Bundles """"""
" easy forward motion navigation
Bundle 'Lokaltog/vim-easymotion'
" file, buffer, MRU finder
Bundle 'kien/ctrlp.vim'
" syntax error highlighter
Bundle 'scrooloose/syntastic'
" easy commenting
Bundle 'scrooloose/nerdcommenter'
" easily changing matching pairs surrounding text
Bundle 'tpope/vim-surround'
" use . to repeat last plugin command -- for surround
Bundle 'tpope/vim-repeat'
" show marks
"Bundle 'ShowMarks'
Bundle 'kshenoy/vim-signature'
" switch between header and source
Bundle 'vim-scripts/a.vim'
" search tab completion
Bundle 'SearchComplete'
" enhanced statusline -- TODO: figure out how this works
Bundle 'Lokaltog/powerline'
" TODO: check out vim-fugitive


" Install bundles with vundle if necessary
if exists("s:bootstrap") && s:bootstrap
	unlet s:bootstrap
	BundleInstall
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundle Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_by_filename = 1
let g:ctrlp_root_markers = ['pom.xml'] "find maven projects
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](\.settings|target|\.git)$',
	\ }

" Syntastic
"let g:syntastic_check_on_open=1 "check for errors when opening file
let g:syntastic_mode_map = { 'mode': 'passive'} "only find errors when asked

" Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme='desert'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command/search history
set history=200

""" File types
filetype on "detect file type
filetype plugin on "load filetype plugins
filetype indent on "load file-specific indent files

" Update file when modified elsewhere on leaving buffer
set autoread
" Controls rate at which CursorHold is triggered (in ms)
set updatetime=10000
" Check for changes on disk to file in buffer after user inactivity
autocmd CursorHold * checktime

" Abbreviate file messages
set shortmess=a

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
set wildignore+=*.o,*.class,*.pyc			"compiled files
set wildignore+=*.zip,*.tar*,*.rar,*.jar	"compressed files
set wildignore+=*~,*.swp					"temps and backups

""" Better search
set incsearch "Incremental Search - search as you type
set ignorecase "Ignore case when searching
set smartcase "Override ignorecase when search contains UC chars
set hlsearch "Highlight search results

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

set splitright
set splitbelow
" Resize splits when vim window resized
autocmd VimResized * :wincmd =


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

""" Color scheme and theme
set t_Co=256 "enable 256 colors
colorscheme desert
set background=dark

set encoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups, swaps, and undos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No backup files
set nobackup

""" Save undo history in file
if has("persistent_undo")
	" create ~/.vim/undo if it doesn't already exist and ignore all errors/output
	silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	set undodir=~/.vim/undo
	set undofile
	set undolevels=100
endif


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
" round indent to multiple of shiftwidth
set shiftround

" Auto indent new lines
set autoindent
set smartindent

" Wrap lines
set wrap

" show unnecessary white space
let c_space_errors = 1
let java_space_errors = 1
let python_space_errors = 1
let ruby_space_errors = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer views
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unix/slash added for better windows-unix compatibility
set viewoptions=folds,options,cursor,unix,slash

" save and load views (states) for buffers automatically
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent loadview


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
set statusline+=%h      "help file flag: [help]
set statusline+=%m      "modified flag: [+]
set statusline+=%r      "read only flag: [RO]
set statusline+=\ Buffer:%n
"set statusline+=\ \ CWD:%{getcwd()}		"current directory
set statusline+=%=      "left/right fields separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P\     "percent through file


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on spell checking
set spell

" Specify file to store words deemed correctly spelled -- NEED V7.4??
"spellfile+=~/.vim/spell/en.utf-8.add


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii
inoremap ii <ESC>`^
" Remap _ to ;;
inoremap ;; _
" Make insert mode pasting easier
inoremap <C-r><C-r> <C-r>"

" Remap ^ and $ to ctrl-h and ctrl-l -- this works
nnoremap <C-h> ^
nnoremap <C-l> $
" Remap ^ and $ to ,j and ,k -- DOESN'T QUITE WORK
"nnoremap <leader>j ^ 
"nnoremap <leader>k $ 

" Switch back to most recently used previous buffer/window
nnoremap <leader>b <C-^>
nnoremap <leader>w <C-w><C-w>

nnoremap <leader>l :ls<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

nnoremap <leader>cls :let @/=""<CR>

" edit and source vimrc (this file)
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" upper/lowercase word
nnoremap <leader>u guiw 
nnoremap <leader>U gUiw 

" CtrlP
nnoremap <leader>cpb :CtrlPBuffer<CR>
nnoremap <leader>cpm :CtrlPMRU<CR>

" A.vim
nnoremap <leader>ga gf:A<CR>
nnoremap <leader>gas gf:AS<CR>
nnoremap <leader>gav gf:AV<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Local config
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
