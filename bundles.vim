
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'blueyed/vim-diminactive'

let g:ctrlp_map = '<leader>e'
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_dotfiles = 0
let g:ctrlp_custom_ignore = {
    \ 'files': '\.py[oc]$',
    \ 'venvs': '\v[\/]venv$',
    \ 'rcs':   '\v[\/]\.(git|hg|snv)$'
    \ }
Plugin 'vim-scripts/ctrlp.vim'

call vundle#end()
filetype plugin indent on
