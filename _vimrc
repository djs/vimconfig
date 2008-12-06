" Basic options
set nocompatible
set background=dark
syntax on
set backspace=2
set history=1000

" Indentation policy
set noinsertmode
set expandtab
set tabstop=4
set shiftwidth=4
set preserveindent
set nowrap
"set cindent

" File format configuration
set fileformats=unix,dos
filetype plugin on
filetype indent on

" Case
set ignorecase
set smartcase

" Tags
set tags=./tags;/

" Color scheme
colorscheme vividchalk

" Editor configuration
set list listchars=tab:»·,trail:·
set ruler
set number
set showmatch
set nohlsearch
set incsearch
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set ai
set si
set hidden
set wildmenu
set wildmode=list:longest
set wildignore=*.dll,*.o,*.obj,*.d,*.bak.*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png
set cmdheight=1
set popt+=syntax:y
set mouse=a
set shortmess:atI
set noerrorbells
set report=0
set scrolloff=5
set sidescrolloff=5

set laststatus=2

"Folding
set foldenable
set foldcolumn=4
set foldopen-=search
set foldopen-=undo
function MyFoldText()
    return getline(v:foldstart).' '
endfunction
set foldtext=MyFoldText()

" GUI
if has("gui")
    set guifont=Consolas:h10:cANSI
    set lines=60 columns=160
    set cursorline
endif



" Syntax and Autocompletion
autocmd BufEnter * :syntax sync fromstart
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

set completeopt=menu,longest,preview


set statusline=%<%t%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:0x%B\ %P 
let perl_extended_vars=1

map <F12> <ESC>:NERDTreeToggle<RETURN>
map <F11> <ESC>:TlistToggle<RETURN>

let Tlist_Ctags_Cmd = 'ctags' " Location of ctags
let Tlist_Sort_Type = "name" " order by
let Tlist_Auto_Open=1 " let the tag list open automagically
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Compact_Format = 1 " show small meny
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 1 " Do not close tags for other files
let Tlist_Enable_Fold_Column = 0 " Do show folding tree
let Tlist_WinWidth = 40 " 40 cols wide, so I can (almost always) read my functions

let g:AutoPreview_enabled =1 
nnoremap <F5> :AutoPreviewToggle<CR>
inoremap <F5> <ESC>:AutoPreviewToggle<CR>i
set updatetime=500 


