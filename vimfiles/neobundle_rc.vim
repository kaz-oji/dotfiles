"------------------------------------------------------------
" Neobundle.vim configurations.
"------------------------------------------------------------

filetype off

if has('vim_starting')
	set runtimepath+=$DOTVIM/bundle/neobundle.vim/
endif

call neobundle#begin( expand('$DOTVIM/bundle/') )

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'taglist.vim'
NeoBundle 'vim-scripts/desert256.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'rking/ag.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'sjl/badwolf'
NeoBundle 'vim-scripts/phd'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'NLKNguyen/papercolor-theme'
NeoBundle 'chriskempson/vim-tomorrow-theme'

if !has('win32unix') && (has('mac') || has('unix'))
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
endif

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
