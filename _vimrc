set nocompatible

"------------------------------------------------------------
" environment dependence
"------------------------------------------------------------
if has('win32') || has('win64')
	set shellslash
	let $DOTVIM = expand('~/vimfiles')
else
	let $DOTVIM = expand('~/.vim')
endif

"------------------------------------------------------------
" バックアップ設定
"------------------------------------------------------------
set backupdir=$DOTVIM/backups
set directory=$DOTVIM/swp

"------------------------------------------------------------
" Tab 設定
"------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set noexpandtab

"------------------------------------------------------------
" NeoBundle setting
"------------------------------------------------------------
filetype off

if has('vim_starting')
	set runtimepath+=$DOTVIM/bundle/neobundle.vim/
endif

call neobundle#rc( expand('$DOTVIM/bundle/') )

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'taglist.vim'

filetype plugin indent on

NeoBundleCheck

"------------------------------------------------------------
" key mapping
"------------------------------------------------------------
nnoremap <SPACE> <PageDown>
nnoremap <S-SPACE> <PageUp>
nnoremap ZZ <Nop>

" for Unite
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
"nmap <M-u> [unite]
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>

" for TagList
nnoremap [tlist] <Nop>
nmap <Leader>t [tlist]
nnoremap <silent> [tlist]o :<C-u>TlistOpen<CR>
nnoremap <silent> [tlist]c :<C-u>TlistClose<CR>

"------------------------------------------------------------
" howm setting
"------------------------------------------------------------
let howm_dir='~/howm'
let howm_filename='%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding='cp932'
let howm_fileformat='dos'

let QFixHowm_ST=-9
let mygrepprg='agrep.vim'

let QFixHowm_Menufile='0000-00-00-000000.txt'
let QFixMRU_RegisterFile = '\.\(howm\|txt\|mkd\|wiki\)$'

"------------------------------------------------------------
" 特殊文字表示
"------------------------------------------------------------
set list
" <TAB> を表示
set listchars=tab:^\ 

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

