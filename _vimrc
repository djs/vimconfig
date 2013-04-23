" File:     .vimrc
" Author:   Dan Savilonis <djs AT n-cube.org>
" URL:      http://gitorious.org/djs-tools/vimsettings
" License:  CC0 <http://creativecommons.org/publicdomain/zero/1.0/>
"           To the extent possible under law, Dan Savilonis has waived all
"           copyright and related or neighboring rights to this work. This
"           work is published from United States.
"

set nocompatible
filetype off


" VUNDLE BUNDLE CONFIGURATION
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------

" Vundle plugin management
"-------------------------------------------------------------------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Color Schemes
"-------------------------------------------------------------------------------
"Bundle 'jpo/vim-railscasts-theme'
Bundle 'dhruvasagar/vim-railscasts-theme'
Bundle 'tpope/vim-vividchalk'
Bundle 'vibrantink'

" Syntax Highlighting
"-------------------------------------------------------------------------------
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'skammer/vim-css-color'
Bundle 'rodjek/vim-puppet'
Bundle 'juvenn/mustache.vim'
Bundle 'groenewege/vim-less'

let g:vim_markdown_folding_disabled=1

" Source Control
"-------------------------------------------------------------------------------
"Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" Navigation
"-------------------------------------------------------------------------------
Bundle 'sandeepcr529/Buffet.vim'
Bundle 'kien/ctrlp.vim'

" Snippets
"-------------------------------------------------------------------------------
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

" Macros
"-------------------------------------------------------------------------------
Bundle 'tpope/vim-commentary'

" Powerline
"-------------------------------------------------------------------------------
Bundle 'Lokaltog/powerline'
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim



Bundle 'ervandew/supertab'

" clang-complete
"-------------------------------------------------------------------------------
Bundle 'Rip-Rip/clang_complete'

"Bundle 'klen/python-mode'

let g:clang_snippets=1
set concealcursor=inv
set conceallevel=2
let g:clang_conceal_snippets=1
let g:clang_close_preview=1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_highlight_errors = 1



Bundle 'Lokaltog/vim-easymotion'
Bundle 'mileszs/ack.vim'

if 0
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'xolox/vim-open-associated-programs'
"Bundle 'xolox/vim-shell'
"Bundle 'xolox/vim-easytags'
Bundle 'scrooloose/syntastic'
"Bundle 'thinca/vim-quickrun'
Bundle 'bogado/file-line'
"Bundle 'majutsushi/tagbar'
"Bundle 'abudden/TagHighlight'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-surround'
"Bundle 'jpythonfold.vim'
"Bundle 'tpope/vim-abolish'
Bundle 'sjl/gundo.vim.git'
"Bundle 'kevinw/pyflakes-vim'
Bundle 'nvie/vim-flake8'
Bundle 'fs111/pydoc.vim'
Bundle 'jmcantrell/vim-virtualenv'
"Bundle 'CycleColor'
"Bundle 'AutoComplPop'
"Bundle 'tarmack/vim-python-ftplugin'
Bundle 'davidhalter/jedi-vim'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-repeat'
"Bundle 'xolox/vim-shell'
Bundle 'tpope/vim-unimpaired'
Bundle 'tsaleh/vim-matchit'
Bundle 'majutsushi/tagbar'
endif


" Look and feel
"-------------------------------------------------------------------------------
set noinsertmode
set nowrap
set noshowmode

" Smart visible whitespace. Only highlights bad whitespace (and tabs)
set list listchars=tab:»·,trail:·
"set ruler
set relativenumber

" status line
set cmdheight=2
set laststatus=2

" Assume gnome-terminal is 256 color capable
" Note that this is preferably worked around in my .bashrc
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Color scheme
"-------------------------------------------------------------------------------
colorscheme railscasts

" Basic options
"-------------------------------------------------------------------------------
set directory=~/.vim/tmp
set background=dark
syntax on
set backspace=2
set history=1000
" link clipboard (*) to unnamed register
set clipboard=unnamed
set encoding=utf-8

" Indentation policy
"-------------------------------------------------------------------------------
"  * I prefer 4-space soft indents, but don't want to mess with existing tabs
"  * Indentation mode is defined by filetype
set expandtab
set softtabstop=4
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

" Use hard tabs for Makefiles
"-------------------------------------------------------------------------------
augroup filetype_make
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END

" Case
"-------------------------------------------------------------------------------
"  * Case insensitive search is useful
"  * smartcase covers 90% of cases, so I'm willing to turn off ignorecase
"    for the other 10% of the time when I need to search only lowercase
"  * To search for lowercase only, add \C in search
set ignorecase
set smartcase

" Tags
"  * Search for tags recursively in the current directory
"-------------------------------------------------------------------------------
set tags=./tags;/


" Editor configuration
"-------------------------------------------------------------------------------
set showmatch
set hlsearch
" show matches as they are found
set incsearch
set si
" Prevent irritation when following tags from a file with modifications
set hidden
" Print with syntax highlighting!
set popt+=syntax:y
set shortmess:atI
set noerrorbells
" always report number of lines changed
set report=0
" leave 5 lines on screen for scrolling
set scrolloff=5
set sidescrolloff=5

" vim command-line completion
set wildmenu
set wildmode=list:longest,full
set wildignore=*.dll,*.o,*.obj,*.d,*.bak.*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png
set wildignore+=*.bin,*.swo

set completeopt=menu,longest,preview

"Folding
"-------------------------------------------------------------------------------
"set foldenable
"set foldcolumn=4
"set foldopen-=search
"set foldopen-=undo
"" this is a more useful foldtext than the default, but still useless
"function! MyFoldText()
"    return getline(v:foldstart).' '
"endfunction
"set foldtext=MyFoldText()

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


"syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" gui specific options
"-------------------------------------------------------------------------------
if has("gui_running")
    " choose font differently for windows and non-windows
    if has("win32")
        set guifont=Liberation\ Mono\ for\ Powerline:h11:cANSI,Liberation\ Mono:h11:cANSI
        "set guifont=Consolas:h10:cANSI
    else
        set guifont=Liberation\ Mono\ 10
    endif
    set lines=60 columns=160
    set cursorline

    set guioptions-=T
endif

nnoremap <silent> <F12> :TagbarToggle<CR>
let g:tagbar_expand = 1
"let g:tagbar_usearrows = 1

let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:indent_guides_guide_size = 1

let mapleader = ","

let g:python_syntax_fold=0
let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#show_function_definition = 0

inoremap jk <Esc>
inoremap <Esc> <nop>
inoremap <C-c> <Esc>
inoremap  <Up>     <nop>
inoremap  <Down>   <nop>
inoremap  <Left>   <nop>
inoremap  <Right>  <nop>
noremap   <Up>     <nop>
noremap   <Down>   <nop>
noremap   <Left>   <nop>
noremap   <Right>  <nop>
nnoremap ; :
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>g :GundoToggle<CR>
nnoremap <silent> <F2> :let @/=""<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>b :Bufferlist<CR>
