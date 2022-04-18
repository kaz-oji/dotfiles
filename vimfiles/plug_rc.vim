"------------------------------------------------------------
" vim-plug.vim configurations.
"------------------------------------------------------------

" install plug.vim if does not exists.
if empty(glob(expand($DOTVIM . '/autoload/plug.vim')))
    if has('unix')
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    elseif has('win32')
        set shell=powershell.exe
        set shellcmdflag=-c
        set shellquote=\"
        set shellxquote=

        silent !iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |
                    \ ni $env:HOME/vimfiles/autoload/plug.vim -Force

        echom "Please reboot Vim and execute :PlugInstall"
        q!
        " Windows 上では次の autocmd が正常に動作しないため再起動して手動実行 させる
        "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

call plug#begin(expand($DOTVIM . '/plugged'))

Plug 'lambdalisue/fern.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'hewes/unite-gtags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'itchyny/lightline.vim'
Plug 'tyru/capture.vim'

"------------------------------------------------------------
" for ddu.vim
"------------------------------------------------------------
Plug 'vim-denops/denops.vim'
" Uncomment and install when cheking if denops.vim works.
"Plug 'vim-denops/denops-helloworld.vim'
Plug 'Shougo/ddu.vim'
Plug 'Shougo/ddu-ui-ff'
Plug 'Shougo/ddu-source-file_rec'
Plug 'Shougo/ddu-commands.vim'

Plug 'lambdalisue/mr.vim'
Plug 'kuuote/ddu-source-mr'

Plug 'Shougo/ddu-source-register'

Plug 'Shougo/ddu-filter-matcher_substring'

Plug 'Shougo/ddu-kind-file'
Plug 'Shougo/ddu-kind-word'

Plug 'shun/ddu-source-buffer'

" vimproc
if !has('win32unix') && (has('mac') || has('unix'))
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
endif

" git 
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" language
Plug 'rhysd/vim-llvm'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

" vim-lsp
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" colorscheme
Plug 'vim-scripts/desert256.vim'
Plug 'vim-scripts/phd'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'jeffreyiacono/vim-colors-wombat'
Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'

Plug 'vim-jp/vimdoc-ja'

call plug#end()
