" File:     .vimrc
" Author:   Dan Savilonis <djs AT n-cube.org>
" URL:      http://gitorious.org/djs-tools/vimsettings
" License:  CC0 <http://creativecommons.org/publicdomain/zero/1.0/>
"           To the extent possible under law, Dan Savilonis has waived all
"           copyright and related or neighboring rights to this work. This
"           work is published from United States.
"

" Basic options
"-------------------------------------------------------------------------------
set nocompatible
set background=dark
syntax on
set backspace=2
set history=1000
" link clipboard (*) to unnamed register
set clipboard=unnamed
set noinsertmode
set nowrap

" Indentation policy
"  * I prefer 4-space soft indents, but don't want to mess with existing tabs
"  * Indentation mode is defined by filetype
"-------------------------------------------------------------------------------
set expandtab
set tabstop=4
set shiftwidth=4
set preserveindent
set ai

" File format configuration
"  * Prefer UNIX format for new files
"-------------------------------------------------------------------------------
set fileformats=unix,dos
filetype plugin on
filetype indent on

" Case
"  * Case insensitive search is useful
"  * smartcase covers 90% of cases, so I'm willing to turn off ignorecase
"    for the other 10% of the time when I need to search only lowercase
"-------------------------------------------------------------------------------
set ignorecase
set smartcase

" Tags
"  * Search for tags recursively in the current directory
"-------------------------------------------------------------------------------
set tags=./tags;/

" Color scheme
"-------------------------------------------------------------------------------
colorscheme vividchalk

" Editor configuration
"-------------------------------------------------------------------------------
" Smart visible whitespace. Only highlights bad whitespace (and tabs)
set list listchars=tab:»·,trail:·
set ruler
set number
set statusline=%<%t%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:0x%B\ %P 

" status line
set cmdheight=1
set laststatus=2

set showmatch
set nohlsearch
" show matches as they are found
set incsearch
set si
" Prevent irritation when following tags from a file with modifications
set hidden
" Print with syntax highlighting!
set popt+=syntax:y
set mouse=a
set shortmess:atI
set noerrorbells
" always report number of lines changed
set report=0
" leave 5 lines on screen for scrolling
set scrolloff=5
set sidescrolloff=5

" vim command-line completion
set wildmenu
set wildmode=list:longest
set wildignore=*.dll,*.o,*.obj,*.d,*.bak.*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png
set wildignore+=*.bin,*.swo

set completeopt=menu,longest,preview

"Folding
"-------------------------------------------------------------------------------
set foldenable
set foldcolumn=4
set foldopen-=search
set foldopen-=undo
" this is a more useful foldtext than the default, but still useless
function! MyFoldText()
    return getline(v:foldstart).' '
endfunction
set foldtext=MyFoldText()

" Cscope
"-------------------------------------------------------------------------------
if has("cscope")
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
    set cscopetag
endif

" misc
"-------------------------------------------------------------------------------
" inline doxygen highlighting in C files
let g:load_doxygen_syntax=1

" gui specific options
"-------------------------------------------------------------------------------
if has("gui_running")
    " choose font differently for windows and non-windows
    if has("win32")
        set guifont=Consolas:h10:cANSI
    else
        set guifont=Liberation\ Mono\ 10
    endif
    set lines=60 columns=160
    set cursorline

    set guioptions-=T
endif

