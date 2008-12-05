set nocompatible
set fileformats=unix,dos
filetype plugin on
filetype indent on
set noinsertmode
set expandtab
set tabstop=4
set shiftwidth=4
set tags=./tags;/
set list listchars=tab:»·,trail:·
syntax on
colorscheme vividchalk
set ruler
set number
set showmatch
set nohlsearch
set incsearch
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set ai
set si
"set cindent
set nowrap
let perl_extended_vars=1
autocmd BufEnter * :syntax sync fromstart
set guifont=Consolas:h10:cANSI
set backspace=2
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let g:load_doxygen_syntax=1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let g:cvimsyn= expand('${HOME}/vimfiles/CVIMSYN')
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:0x%B\ %P 
set laststatus=2
set lines=55 columns=150









