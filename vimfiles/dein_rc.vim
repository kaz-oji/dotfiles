"------------------------------------------------------------
" dein.vim configurations.
"------------------------------------------------------------

let s:bundle_dir = expand($DOTVIM) . '/dein'
let s:dein_dir = s:bundle_dir . '/repos/github.com/Shougo/dein.vim'

" install dein.vim if not installed.
if !isdirectory( s:dein_dir )
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

" add dein_dir to runtimepath vim at starting time only.
if has('vim_starting')
    execute 'set runtimepath ^=' . s:dein_dir
endif

if dein#load_state( s:bundle_dir )
    call dein#begin( s:bundle_dir )

    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/neomru.vim')
    call dein#add('Shougo/vimfiler')
    call dein#add('Shougo/unite-outline')
    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('taglist.vim')
    call dein#add('fuenor/qfixhowm')
    call dein#add('itchyny/lightline.vim')

    "colorscheme
    call dein#add('vim-scripts/desert256.vim')
    call dein#add('vim-scripts/phd')
    call dein#add('NLKNguyen/papercolor-theme')
    call dein#add('chriskempson/vim-tomorrow-theme')
    call dein#add('jeffreyiacono/vim-colors-wombat')
    call dein#add('sjl/badwolf')

    " vimproc
    if !has('win32unix') && (has('mac') || has('unix'))
        call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    endif

    call dein#end()

    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif