"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :PluginList		- list bundles
" :PluginInstall	- install/update bundles
" :PluginClean		- remove bundles
" :PluginSearch		- search for bundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " use vim settings instead of vi settings (required)
filetype off " required

" Install vundle for first time if necessary
if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
	call mkdir(expand("~/.vim/bundle"), "p")
	!git clone git://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	let s:bootstrap=1 "indicates vundle needed to be installed
endif

" setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

""""" My Plugins """"""
" easy forward motion navigation
Plugin 'Lokaltog/vim-easymotion'
" file, buffer, MRU finder
Plugin 'kien/ctrlp.vim'
" automatic source code tagging for easy code browsing
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc' " support plugin
Plugin 'xolox/vim-shell' " needed for async tagging on Windows
" syntax error highlighter
Plugin 'scrooloose/syntastic'
" easy commenting
Plugin 'scrooloose/nerdcommenter'
" show marks
"Plugin 'ShowMarks'
Plugin 'kshenoy/vim-signature'
" multiple selections
Plugin 'terryma/vim-multiple-cursors'
" easily changing matching pairs surrounding text
Plugin 'tpope/vim-surround'
" use . to repeat last plugin command -- for surround
Plugin 'tpope/vim-repeat'
" switch between header and source
Plugin 'vim-scripts/a.vim'
" xml tag completion -- TODO: don't understand how this works
"Plugin 'sukima/xmledit'
" search tab completion
Plugin 'SearchComplete'
" enhanced statusline -- TODO: figure out how this works
"Plugin 'bling/vim-airline'
" TODO: check out vim-fugitive

" Local config (may have plugins)
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif

" All plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required

" Install bundles with vundle if necessary
if exists("s:bootstrap") && s:bootstrap
	unlet s:bootstrap
	PluginInstall
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_by_filename = 1
"let g:ctrlp_root_markers = ['pom.xml', 'build.xml', 'Makefile']
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](\.settings|\.idea|target|\.git)$',
	\ 'file': '\v\.(exe|dll|so|class|o|pyc|zip|tar|rar|jar)$',
	\ }

" Syntastic
"let g:syntastic_check_on_open=1 "check for errors when opening file
let g:syntastic_mode_map = { 'mode': 'passive'} "only find errors when asked

" Multiple Cursors
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_quit_key='ii'

" Airline
"let g:airline#extensions#tabline#enabled = 1

" Easytags
let g:easytags_async = 1
let g:easytags_resolve_links = 1
"let g:easytags_always_enabled = 1 " too slow

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command/search history
set history=500

""" File types
filetype on "detect file type
filetype plugin on "load filetype plugins
filetype indent on "load file-specific indent files
" use shell syntax coloring for all files in ~/.bash -- TODO: not working
autocmd BufRead,BufNewFile ~/dotfiles/.bash/*,~/.bash/* set syntax=sh

" Update file when modified elsewhere on leaving buffer
set autoread
" Controls rate at which CursorHold is triggered (in ms)
set updatetime=10000
" Check for changes on disk to file in buffer after user inactivity
autocmd CursorHold * checktime
" Automatically reload vimrc when modified
augroup vimrc
	au!
	au BufWritePost .vimrc,vimrc source $MYVIMRC
augroup END

" Abbreviate file messages
set shortmess=a

set lazyredraw

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
set wildignore+=.git								"version control directories
set wildignore+=.idea,.settings,target				"IDE/build directories
set wildignore+=*.o,*.class,*.pyc,*.dll,*.so,*.exe	"compiled files
set wildignore+=*.zip,*.tar*,*.rar,*.jar			"compressed files
set wildignore+=*~,*.swp,*.un*						"temps and backups
set wildignore+=*.aux,*.synctex.gz					"latex files
set wildignore+=*.bmp,*.gif,*.jpeg,*.jpg,*.png		"image files
set wildignore+=*.pdf

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
syntax enable

""" Color scheme and theme
set t_Co=256 "enable 256 colors
colorscheme desert
set background=dark
" highlight Java tags in red through vim-easytags
highlight javaClassTag ctermfg=red
highlight javaInterfaceTag ctermfg=red
highlight javaMethodTag ctermfg=red

set encoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups, swaps, and undos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No backup files
set nobackup

""" Save undo history in file
if has("persistent_undo")
	" create ~/.vim/undo if it doesn't already exist
	if !isdirectory(expand("~/.vim/undo"))
		call mkdir(expand("~/.vim/undo"), "p")
	endif
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
" Buffer views and vim sessions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unix/slash added for better windows-unix compatibility
set viewoptions=folds,options,cursor,unix,slash

" save and load views (states) for buffers automatically
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

" update session on quitting vim if session has already been created
autocmd VimLeave * :call UpdateSession()
nnoremap <leader>ms :call MakeSession()<CR>
nnoremap <leader>ls :call LoadSession()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show status line
set laststatus=2

" Format the status line
"TODO: put in mode at begginning
set statusline=%t       "filename
"set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=\ [%{&ff}] "file format
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
set nospell

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

" Remap ^ and $ to ctrl-h and ctrl-l
nnoremap <C-h> ^
nnoremap <C-l> $
vnoremap <C-h> ^
vnoremap <C-l> $
" Remap ^ and $ to ,j and ,k -- DOESN'T QUITE WORK
"nnoremap <leader>j ^ 
"nnoremap <leader>k $ 

" Switch back to most recently used previous buffer/window
nnoremap <leader>b <C-^>
nnoremap <leader>w <C-w><C-w>

nnoremap <leader>l :ls<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

" find usages (search) for word under cursor recursively from current directory
nnoremap <leader>fu :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" highlight current word
nnoremap <leader>hl *N
" clear search results
nnoremap <leader>cls :let @/=""<CR>
" delete lhs of an assignment statement (including equals sign)
nnoremap <leader>da df=x

" edit and source vimrc (this file)
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" upper/lowercase word
nnoremap <leader>u guiw 
nnoremap <leader>U gUiw 

" CtrlP
nnoremap <leader>cpb :CtrlPBuffer<CR>
nnoremap <leader>cpm :CtrlPMRU<CR>

" Easytags
"go to declartion of tag under cursor
nnoremap <leader>gd <C-]>
"update tags recurisvely from current directory
nnoremap <leader>ut :UpdateTags -R .<CR>

" vim-signature
nnoremap <leader>mn ]'
nnoremap <leader>mp ['
" TODO: these don't work
"nnoremap <leader>mna ']
"nnoremap <leader>mpa '[

" A.vim
nnoremap <leader>ga gf:A<CR>
nnoremap <leader>gas gf:AS<CR>
nnoremap <leader>gav gf:AV<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Creates a session
function! MakeSession()
	let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
	if (filewritable(b:sessiondir) != 2)
		"call mkdir(expand(b:sessiondir), "p")
		exe "silent !mkdir -p " . b:sessiondir
		redraw!
	endif
	let b:sessionfile = b:sessiondir . "/session.vim"
	exe "mksession! " . b:sessionfile
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
	if argc() == 0
		let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
		let b:sessionfile = b:sessiondir . "/session.vim"
		if (filewritable(b:sessionfile))
			exe "mksession! " . b:sessionfile
			"echo "updating session"
		endif
	endif
endfunction

" Loads a session if it exists
function! LoadSession()
	"if argc() == 0
		let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
		let b:sessionfile = b:sessiondir . "/session.vim"
		if (filereadable(b:sessionfile))
			exe "source " . b:sessionfile
		else
			"echo "No session loaded."
		endif
	"else
		"let b:sessionfile = ""
		"let b:sessiondir = ""
	"endif
endfunction
