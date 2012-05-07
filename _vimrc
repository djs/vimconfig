" File:     .vimrc
" Author:   Dan Savilonis <djs AT n-cube.org>
" URL:      http://gitorious.org/djs-tools/vimsettings
" License:  CC0 <http://creativecommons.org/publicdomain/zero/1.0/>
"           To the extent possible under law, Dan Savilonis has waived all
"           copyright and related or neighboring rights to this work. This
"           work is published from United States.
"

" Vundle plugin management
"-------------------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'xolox/vim-open-associated-programs'
"Bundle 'xolox/vim-shell'
"Bundle 'xolox/vim-easytags'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
"Bundle 'thinca/vim-quickrun'
Bundle 'bogado/file-line'
Bundle 'plasticboy/vim-markdown'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'vibrantink'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim.git'
Bundle 'garbas/vim-snipmate.git'
Bundle 'honza/snipmate-snippets'
"Bundle 'majutsushi/tagbar'
"Bundle 'abudden/TagHighlight'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-surround'
"Bundle 'jpythonfold.vim'
"Bundle 'tpope/vim-abolish'
Bundle 'Command-T'
Bundle 'sjl/gundo.vim.git'
"Bundle 'kevinw/pyflakes-vim'
Bundle 'nvie/vim-flake8'
Bundle 'fs111/pydoc.vim'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'flazz/vim-colorschemes'
Bundle 'CycleColor'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'AutoComplPop'

" Basic options
"-------------------------------------------------------------------------------
set directory=~/.vim/tmp
set background=dark
syntax on
set backspace=2
set history=1000
" link clipboard (*) to unnamed register
set clipboard=unnamed
set noinsertmode
set nowrap
set encoding=utf-8

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

" Use hard tabs for Makefiles
"-------------------------------------------------------------------------------
augroup filetype_make
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END

" Case
"  * Case insensitive search is useful
"  * smartcase covers 90% of cases, so I'm willing to turn off ignorecase
"    for the other 10% of the time when I need to search only lowercase
"  * To search for lowercase only, add \C in search
"-------------------------------------------------------------------------------
set ignorecase
set smartcase

" Tags
"  * Search for tags recursively in the current directory
"-------------------------------------------------------------------------------
"set tags=./tags;/

" Color scheme
"-------------------------------------------------------------------------------
colorscheme railscasts

" Editor configuration
"-------------------------------------------------------------------------------
" Smart visible whitespace. Only highlights bad whitespace (and tabs)
set list listchars=tab:»·,trail:·
set ruler
set number
"set statusline=%<%t%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:0x%B\ %P 

"statusline setup
set statusline=%f       "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

" status line
set cmdheight=1
set laststatus=2

"syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

"recalculate the trailing whitespace warning when idle, and after saving
augroup whitespace
    autocmd!
    autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
augroup END

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

set showmatch
set hlsearch
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

" gui specific options
"-------------------------------------------------------------------------------
if has("gui_running")
    " choose font differently for windows and non-windows
    if has("win32")
        set guifont=Liberation\ Mono:h11:cANSI
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

inoremap jk <Esc>
inoremap <Esc> <nop>
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
