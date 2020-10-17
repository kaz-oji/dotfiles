"------------------------------------------------------------
" vim-plug.vim configurations.
"------------------------------------------------------------

if has('unix')
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

call plug#begin(expand($DOTVIM) . '/plugged')

if has('python3')
    Plug 'Shougo/denite.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'ozelentok/denite-gtags'
endif

Plug 'lambdalisue/fern.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'hewes/unite-gtags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'itchyny/lightline.vim'

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
