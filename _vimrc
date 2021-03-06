" File:     .vimrc
" Author:   Dan Savilonis <djs AT n-cube.org>
" URL:      http://github.com/djs/vimconfig
" License:  CC0 <http://creativecommons.org/publicdomain/zero/1.0/>
"           To the extent possible under law, Dan Savilonis has waived all
"           copyright and related or neighboring rights to this work. This
"           work is published from United States.
"

" NeoBundle plugin management {{{
" https://github.com/Shougo/neobundle.vim
"-------------------------------------------------------------------------------
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
" }}}

" Bundles {{{
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
NeoBundle 'Shougo/unite.vim'

" Color Schemes {{{
"-------------------------------------------------------------------------------
NeoBundle 'dhruvasagar/vim-railscasts-theme'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'vibrantink'
" Probation schemes
NeoBundle 'sjl/badwolf'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'zaiste/Atom'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'Elive/vim-colorscheme-elive'
NeoBundle 'zeis/vim-kolor'
" }}}

" Syntax Highlighting {{{
"-------------------------------------------------------------------------------
NeoBundle 'hdima/python-syntax'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'othree/html5.vim'

" }}}

" Display {{{
"-------------------------------------------------------------------------------
"NeoBundle 'drmikehenry/vim-fontsize'
"NeoBundle 'tpope/vim-characterize.git'
"NeoBundle 'junegunn/goyo.vim'
" }}}

" Source Control {{{
"-------------------------------------------------------------------------------
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'mhinz/vim-signify'
" }}}

" Navigation {{{
"-------------------------------------------------------------------------------
if has('lua')
  NeoBundle 'Shougo/neocomplete.vim'
endif

NeoBundle 'davidhalter/jedi-vim'

"NeoBundle 'tpope/vim-vinegar.git'
NeoBundle 'bling/vim-airline'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'ervandew/supertab'

NeoBundle 'sandeepcr529/Buffet.vim'

NeoBundle 'majutsushi/tagbar'

NeoBundle 'xolox/vim-shell', {
            \ 'depends' : 'xolox/vim-misc' }
"NeoBundle 'xolox/vim-easytags', {
"            \ 'depends' : 'xolox/vim-misc' }

set noshowmode
set tags=./tags;/
" }}}


" Syntax Checking {{{
"-------------------------------------------------------------------------------
"NeoBundle 'scrooloose/syntastic'
"NeoBundleLazy 'syngan/vim-vimlint', {
"    \ 'depends' : 'ynkdir/vim-vimlparser',
"    \ 'autoload' : {
"    \ 'functions' : 'vimlint#vimlint'}}
" }}}


" Editing {{{
"-------------------------------------------------------------------------------
NeoBundle 'Raimondi/delimitMate'

NeoBundle 'tpope/vim-commentary'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
" }}}

" }}}

" End of NeoBundle plugin management {{{
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
" }}}

" Plugin Configuration {{{
"-------------------------------------------------------------------------------
let delimitMate_smart_quotes=1
let delimitMate_expand_cr=2

let g:signify_vcs_list = ['git']

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0

let g:jedi#popup_select_first = 0
let g:jedi#use_tabs_not_buffers = 0

let g:tagbar_iconchars = ['►', '▼'] 

let g:easytags_dynamic_files = 1

"let g:SuperTabDefaultCompletionType = "context"
" }}}

" General Configuration {{{
"-------------------------------------------------------------------------------
syntax on
colorscheme elive

set laststatus=2
set hidden
set incsearch
set backspace=indent,eol,start
set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos
set noerrorbells
set visualbell
set nobackup
set noswapfile
set number
set nowrap
set history=1000
" link clipboard (*) to unnamed register
set clipboard=unnamed

set shiftwidth=4
set expandtab

set wildmenu
set wildmode=list:full
set wildignore=*.dll,*.o,*.obj,*.d,*.bak.*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png
set wildignore+=*.bin,*.swo,*.dbo,*.dba

" highlight notable whitespace
set list listchars=tab:»·,trail:·
" }}}

" GUI Font and Layout Configuration {{{
if has("gui_running")
    " choose font differently for windows and non-windows
    if has("win32")
        set guifont=Liberation\ Mono\ for\ Powerline:h12:cANSI,Liberation\ Mono:h12:cANSI
        "set guifont=Consolas:h10:cANSI
    else
        set guifont=Liberation\ Mono\ 10
    endif
    set lines=55 columns=160
    set linespace=2

    set guioptions-=T
endif
" }}}

" grep {{{
"-------------------------------------------------------------------------------
" use ack for grepping
set grepprg=ack
set grepformat=%f:%l:%m
" }}}

" vimrc editing {{{
"-------------------------------------------------------------------------------
" Vim does not understand NTFS symbolic links and uses a copy and write
" strategy on save that destroys symbolic links on Windows. So, code in
" the true path to my vimrc, by convention.
if has('win32') && isdirectory(expand('~/vimconfig'))
    let $TRUEVIMRC = expand('~/vimconfig/_vimrc')
else
    let $TRUEVIMRC = $MYVIMRC
endif

" Yes, I read Learn Vimscript the Hard Way
" http://learnvimscriptthehardway.stevelosh.com/
" ... and then I made things needlessly more complicated
nnoremap <leader>ev :edit $TRUEVIMRC<cr>
nnoremap <leader>xv :vsplit $TRUEVIMRC<cr>
nnoremap <leader>sv :source $TRUEVIMRC<cr>
" }}}

" {{{ Things I'm testing
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -buffer-name=buffer  buffer<cr>

nnoremap <leader>b :Bufferlist<CR>

if has('lua')
    augroup neocomplete_python
        autocmd!
        autocmd FileType python NeoCompleteLock
    augroup END
endif
" }}}

" vim:fdm=marker
