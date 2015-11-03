set nocompatible

let $VIMHOME=$HOME . '/.vim'

if has('win32') || has('win64')
    set runtimepath=$VIMHOME,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$VIMHOME/after
endif

" import bundles configuration
source $VIMHOME/bundles.vim

" environment directory setup
silent execute '!mkdir -p $VIMHOME/tmp/{view,undo}'
set nobackup
set noswapfile
set viewdir=$VIMHOME/tmp/view/
set undodir=$VIMHOME/tmp/undo/
set undofile
set viminfo='50,n$VIMHOME/tmp/viminfo

" encoding and editing
scriptencoding utf-8
set termencoding=utf-8
set encoding=utf-8
set hidden
set textwidth=79
set wrapmargin=80
set formatoptions=qrn1
set diffopt+=iwhite,vertical

" visuals
set visualbell
set noerrorbells
set ruler
set relativenumber
set showmatch
set cursorline
set colorcolumn=80
set laststatus=2
set showtabline=2
set showmode
set showcmd
set modeline
set showbreak=↪
"set listchars=tab:>.,trail:.,extends:\#,nbsp:.
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«,trail:·
set list
set shortmess+=afilmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
set splitright splitbelow

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" backspace behavour
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]

" lists and menus
set wildmenu
set wildmode=list:longest,full
set wildignore+=*/tmp/*,*/venv/*,*.pyc,*.pyo,*~
set suffixes+=*.pyc,*.pyo,*~

" formatting
set nowrap
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set pastetoggle=<F2> " ?????
set nojoinspaces

" themes and schemes
set t_Co=256
set synmaxcol=200
colorscheme PaperColor " light: PaperColor - dark: darkburn
syntax on

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10
set ttyfast
set lazyredraw

" mappings
let mapleader=','
let g:mapleader=','

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" navigate over wrapped lines as if they were separeted lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" there are other vim ways of moving around
nnoremap <PageUp> <NOP>
nnoremap <PageDown> <NOP>
inoremap <PageUp> <NOP>
inoremap <PageDown> <NOP>
vnoremap <PageUp> <NOP>
vnoremap <PageDown> <NOP>
nnoremap <UP> <NOP>
nnoremap <DOWN> <NOP>
nnoremap <LEFT> <NOP>
nnoremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
vnoremap <UP> <NOP>
vnoremap <DOWN> <NOP>
vnoremap <LEFT> <NOP>
vnoremap <RIGHT> <NOP>

" split current window
nnoremap <leader>v <C-w>v
nnoremap <leader>h <C-w>s

" split resizing
nnoremap <C-S-Left> <c-w><
nnoremap <C-S-Right> <c-w>>
nnoremap <C-S-Up> <c-w>-
nnoremap <C-S-Down> <c-w>+

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Expand/Collapse foldings using space
nnoremap <space> za

vnoremap <leader>s :sort<cr> "sort selection lines
nnoremap <leader>/ :noh<cr> " clear out search highlights
nnoremap <leader>a :let &scrolloff=999-&scrolloff<cr> " toggle 'keep current line in the center of the screen' mode

" buffers listing using CtrlP plugin.
nnoremap <leader>t :CtrlPBuffer<cr>

" underline current line
nnoremap <Leader>= yypVr=
nnoremap <Leader>- yypVr-

" clean trailing whitespace
nnoremap <leader>x mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" hardwrap text paragraphs
nnoremap <leader>q gqip

" select just pasted text
nnoremap <leader>V V`]


" folding
set foldmethod=marker
set foldlevel=1
set foldnestmax=2

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

"  vim:set foldmarker={{{,}}} foldlevel=0 foldmethod=marker:
