set nocompatible

" environment dependence
if has('win32') || has('win64')
	set shellslash
	let $DOTVIM = expand('~/vimfiles')
else
	let $DOTVIM = expand('~/.vim')
endif

" バックアップ設定
set backupdir=$DOTVIM/backups
set directory=$DOTVIM/swp

" Tab 設定
set tabstop=4
set shiftwidth=4
set noexpandtab

" NeBundle setting
filetype off

if has('vim_starting')
	set runtimepath+=$DOTVIM/bundle/neobundle.vim
endif

call neobundle#rc( expand('$DOTVIM/bundle') )

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'taglist.vim'

filetype plugin indent on

NeoBundleCheck

" key mapping
nnoremap <SPACE> <PageDown>
nnoremap <S-SPACE> <PageUp>
nnoremap ZZ <Nop>

" howm setting
let howm_dir='~/howm'
let howm_filename='%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding='cp932'
let howm_fileformat='dos'

let QFixHowm_ST=-9
let mygrepprg='agrep.vim'

let QFixHowm_Menufile='0000-00-00-000000.txt'
let QFixMRU_RegisterFile = '\.\(howm\|txt\|mkd\|wiki\)$'


