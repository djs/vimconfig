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
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Hello'

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

" vim:fdm=marker
