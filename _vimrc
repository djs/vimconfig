" File:     .vimrc
" Author:   Dan Savilonis <djs AT n-cube.org>
" URL:      http://github.com/djs/vimconfig
" License:  CC0 <http://creativecommons.org/publicdomain/zero/1.0/>
"           To the extent possible under law, Dan Savilonis has waived all
"           copyright and related or neighboring rights to this work. This
"           work is published from United States.
"

set nocompatible

" NeoBundle plugin management {{{
" https://github.com/Shougo/neobundle.vim
"-------------------------------------------------------------------------------
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

filetype plugin indent on
NeoBundleCheck

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
" }}}

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

NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-vinegar.git'
NeoBundle 'tpope/vim-characterize.git'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'dbakker/vim-lint'
NeoBundleLazy 'syngan/vim-vimlint', {
    \ 'depends' : 'ynkdir/vim-vimlparser',
    \ 'autoload' : {
    \ 'functions' : 'vimlint#vimlint'}}
NeoBundle 'junegunn/goyo.vim'
"NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'drmikehenry/vim-fontsize'
NeoBundle 'amix/vim-zenroom2'
let g:gitgutter_realtime=0

let delimitMate_smart_quotes=1
let delimitMate_expand_cr=2
" GUI Font and Layout Configuration {{{
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
" }}}

syntax on
colorscheme elive
set laststatus=2
set hidden
set incsearch
set backspace=indent,eol,start
set encoding=utf-8
set noerrorbells
set visualbell
set nobackup
set noswapfile

" use ack for grepping
set grepprg=ack
set grepformat=%f:%l:%m

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" vim:fdm=marker
