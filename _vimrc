scriptencoding utf-8

set encoding=utf-8

"------------------------------------------------------------
" environment dependence
"------------------------------------------------------------
if has('win32')
" disable shellslash because it causes problem on fern.vim
"	set shellslash
	let $DOTVIM = expand('~/vimfiles')
elseif has('win32unix')
	let $DOTVIM = expand('~/vimfiles')
else
	let $DOTVIM = expand('~/.vim')
endif

if has('macunix')
	let mapleader = "_"
endif

"------------------------------------------------------------
" backup, swap, undo directory settings
"------------------------------------------------------------
set backupdir=$DOTVIM/backups
set directory=$DOTVIM/swp
set undodir=$DOTVIM/undo
set undofile

"------------------------------------------------------------
" Base setting
"------------------------------------------------------------

set ruler
set display=truncate
set showmatch

set ttimeoutlen=100
set ttimeout

set autoindent
set smartindent

set hlsearch
set ignorecase
set smartcase
set incsearch

set backup

set helplang=ja
set nrformats=bin,hex

set cmdheight=2
set history=200

set nolangremap

"------------------------------------------------------------
" Tab setting
"------------------------------------------------------------
set tabstop=4
" shiftwidth is same as tabstop.
set shiftwidth=0
set expandtab

"------------------------------------------------------------
" show special chars
"------------------------------------------------------------
set list
" show tabs by '^' and ' '.
set listchars=tab:^\ 
"                   ^ space char is here!

"------------------------------------------------------------
"全角スペースを　で表示
"------------------------------------------------------------
augroup highlightDoubleByteSpace
  autocmd!
  autocmd Colorscheme * highlight DoubleByteSpace term=underline ctermbg=LightMagenta guibg=LightMagenta
  autocmd VimEnter,WinEnter,BufRead * match DoubleByteSpace /　/
augroup END

"------------------------------------------------------------
" Cursor color for IME
" **need to define before 'colorscheme' command.**
"------------------------------------------------------------
function! s:CursorColor()
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
endfunction

augroup ColorSchemeHook
    autocmd!
    autocmd ColorScheme * call s:CursorColor()
augroup END

"------------------------------------------------------------
" 行数表示
"------------------------------------------------------------
set number

"------------------------------------------------------------
" cursor 
"------------------------------------------------------------
set cursorline

"------------------------------------------------------------
" wildmenu
"------------------------------------------------------------
set wildmenu
set wildmode=full

"------------------------------------------------------------
" virtualedit
"------------------------------------------------------------
set virtualedit=block

"------------------------------------------------------------
" Read plugin manager setting.
"------------------------------------------------------------

execute 'source' $DOTVIM.'/plug_rc.vim'

"------------------------------------------------------------
" vim-gitgutter setting
"------------------------------------------------------------
set updatetime=1000

"------------------------------------------------------------
" grep setting
"------------------------------------------------------------
if executable('rg')
    let &grepprg = 'rg --vimgrep --hidden'
    set grepformat=%f:%l:%c:%m
endif

augroup AutoQuickfix
    autocmd!
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

"------------------------------------------------------------
" Unite setting
"------------------------------------------------------------
" grep setting
if ! empty(globpath(&rtp, 'autoload/unite.vim'))
	if executable('pt')
		" Use pt (the platinum searcher)
		" https://github.com/monochromegane/the_platinum_searcher
		let g:unite_source_grep_command = 'pt'
		let g:unite_source_grep_default_opts = '--nogroup --nocolor'
		let g:unite_source_grep_recursive_opt = ''
	elseif executable('ag')
		" Use ag in unite grep source.
		let g:unite_source_grep_command = 'ag'
		let g:unite_source_grep_default_opts =
					\ '--vimgrep --hidden --ignore ' .
					\  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
		let g:unite_source_grep_recursive_opt = ''
	endif
endif

"------------------------------------------------------------
" ddu.vim setting
"------------------------------------------------------------
if !empty(globpath(&rtp, 'autoload/ddu.vim'))
    " `ddu#custom#patch_global` によってグローバル設定を変更する
    " 'ui' オプションに 'ff' を指定することで `ddu-ui-ff` を読み込むという意味になる
    " `file_rec` source を使用するため `sources` オプションを設定
    " `sourceOptions` に source 固有の設定をする。
    " source 名に `_` を指定することでデフォルトの設定を変更
    " 入力の絞り込みを行う `matchers` として `matcher_substring` を指定
    " kind のデフォルトアクションを設定する必要がある。
    "   →ここでは洗濯するファイルを開く `open` を設定。
    call ddu#custom#patch_global({
        \   'ui': 'ff',
        \   'sources': [{'name': 'file_rec', 'params': {}},],
        \   'sourceOptions': {
        \     '_': {
        \       'matchers': ['matcher_substring'],
        \     },
        \   },
        \   'kindOptions': {
        \     'file': {
        \       'defaultAction': 'open',
        \     },
        \     'word': {
        \       'defaultAction': 'append',
        \     },
        \   },
        \ })

    " grep 用設定
    call ddu#custom#patch_local('grep', {
        \   'sourceParams' : {
        \     'rg' : {
        \       'args': ['--column', '--no-heading', '--color', 'never'],
        \     },
        \   },
        \   'uiParams': {
        \     'ff': {
        \       'startFilter': v:false,
        \     }
        \   },
        \ })

    " Live grep
    command! DduRgLive call <SID>ddu_rg_live()
    function! s:ddu_rg_live() abort
      call ddu#start({
            \   'volatile': v:true,
            \   'sources': [{
            \     'name': 'rg',
            \     'options': {'matchers': []},
            \   }],
            \   'uiParams': {'ff': {
            \     'ignoreEmpty': v:false,
            \     'autoResize': v:false,
            \   }},
            \ })
    endfunction

    " ddu-ui-ff key mappings
    autocmd FileType ddu-ff call s:ddu_ff_my_settings()
    function! s:ddu_ff_my_settings() abort
        nnoremap <buffer><silent> <CR>
            \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
        nnoremap <buffer><silent> <Space>
            \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
        nnoremap <buffer><silent> i
            \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
        nnoremap <buffer><silent> q
            \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
    endfunction

    " ddu-ff-filter key mappings
    autocmd FileType ddu-ff-filter call s:ddu_ff_filter_my_settings()
    function! s:ddu_ff_filter_my_settings() abort
        inoremap <buffer><silent> <CR>
            \ <Esc><Cmd>close<CR>
        nnoremap <buffer><silent> <CR>
            \ <Cmd>close<CR>
        nnoremap <buffer><silent> q
            \ <Cmd>close<CR>
    endfunction
endif

"------------------------------------------------------------
" key mapping
"------------------------------------------------------------
nnoremap <SPACE> <PageDown>
nnoremap <S-SPACE> <PageUp>
nnoremap ZZ <Nop>
inoremap <C-@> <Nop>

" for Unite
if !empty(globpath(&rtp, 'autoload/unite.vim'))
    nnoremap [unite] <Nop>
    nmap <Leader>u [unite]
    "nmap <M-u> [unite]
    nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
    nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
    nnoremap <silent> [unite]f :<C-u>Unite file<CR>
    nnoremap <silent> [unite]o :<C-u>Unite -vertical -winwidth=40 outline<CR>
    nnoremap <silent> [unite]g :<C-u>Unite grep -buffer-name=search-buffer<CR>
    nnoremap <silent> [unite]r :<C-u>UniteResume search-buffer<CR>
endif

" for ddu.vim
if !empty(globpath(&rtp, 'autoload/ddu.vim'))
    nnoremap [ddu] <Nop>
    nmap <Leader>d [ddu]
    " file_rec 実行
    nnoremap <silent> [ddu]f <Cmd>Ddu file_rec<CR>

    " register 実行
    nnoremap <silent> [ddu]r <Cmd>Ddu register<CR>

    " mru 実行
    nnoremap <silent> [ddu]m <Cmd>Ddu mr<CR>

    " buffer 実行
    nnoremap <silent> [ddu]b <Cmd>Ddu buffer<CR>

    " grep 実行
    nnoremap <silent> [ddu]g <Cmd>DduRg<CR>

    " Live grep 実行
    nnoremap <silent> [ddu]gl <Cmd>DduRgLive<CR>

    " カーソル位置の word で grep 実行
    nnoremap <silent> [ddu]gw <Cmd>Ddu rg -source-param-input=`expand('<cword>')`<CR>
endif

if executable('gtags')
    nnoremap [gtags] <Nop>
    nmap <Leader>g [gtags]
    nnoremap <silent> [gtags]b :<C-u>!gtags -v<CR>
    nnoremap <silent> [gtags]u :<C-u>!gtags -vi<CR>

    if !empty(globpath(&rtp, 'autoload/ddu.vim'))
        " カーソル位置の word の定義へジャンプ
        nnoremap <silent> [gtags]d 
            \ <Cmd>Ddu gtags -source-param-args=-d -source-param-input=`expand('<cword>')`<CR>

        " カーソル位置の word の参照箇所を表示
        nnoremap <silent> [gtags]r 
            \ <Cmd>Ddu gtags -source-param-args=-r -source-param-input=`expand('<cword>')`<CR>

        " カーソル位置の word で grep を実行する
        nnoremap <silent> [gtags]g 
            \ <Cmd>Ddu gtags -source-param-args=-g -source-param-input=`expand('<cword>')`<CR>
    elseif !empty(globpath(&rtp, 'autoload/unite-gtags.vim'))

        "" for unite-gtags
        nnoremap <silent> [gtags]d :<C-u>Unite gtags/def<CR>
        nnoremap <silent> [gtags]r :<C-u>Unite gtags/ref<CR>
        nnoremap <silent> [gtags]g :<C-u>Unite gtags/grep<CR>
    endif
endif

if !empty(globpath(&rtp, 'autoload/fern.vim'))
    nnoremap [fern] <Nop>
    nmap <Leader>f [fern]
    nnoremap <silent> [fern]e :<C-u>Fern . -drawer -reveal=% -width=50 -keep -toggle<CR>
    nnoremap <silent> [fern]h :<C-u>Fern %:h<CR>
endif

" for TagList
nnoremap [tlist] <Nop>
nmap <Leader>t [tlist]
nnoremap <silent> [tlist]o :<C-u>TlistOpen<CR>
nnoremap <silent> [tlist]c :<C-u>TlistClose<CR>

"------------------------------------------------------------
" ステータスラインの表示を固定
"------------------------------------------------------------
set laststatus=2
let g:lightline = {
	\ 'colorscheme' : 'wombat',
	\ }

"------------------------------------------------------------
"挿入モード時、ステータスラインの色を変更
"------------------------------------------------------------
let g:hi_insert = 'highlight StatusLine guifg=yellow guibg=darkblue gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" vim-lsp
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_comleteopt = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_signature_help_enabled = 0

"------------------------------------------------------------
" set colorscheme
"------------------------------------------------------------
set background=dark

" for sonokai
if ! empty(globpath(&rtp, 'autoload/sonokai.vim'))
"let g:sonokai_style = 'shusia'
"let g:sonokai_style = 'andromeda'
let g:sonokai_style = 'atlantis'
"let g:sonokai_style = 'maia'
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai
endif
