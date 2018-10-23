scriptencoding utf-8

"------------------------------------------------------------
" environment dependence
"------------------------------------------------------------
if has('win32')
	set shellslash
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

"------------------------------------------------------------
" Tab setting
"------------------------------------------------------------
set tabstop=4
" shiftwidth is same as tabstop.
set shiftwidth=0
set noexpandtab

"------------------------------------------------------------
" Read plugin manager setting.
"------------------------------------------------------------

"execute 'source' $DOTVIM.'/neobundle_rc.vim'
execute 'source' $DOTVIM.'/dein_rc.vim'

"------------------------------------------------------------
" VimFiler setting
"------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1

"------------------------------------------------------------
" Unite setting
"------------------------------------------------------------
" grep setting
if dein#tap('unite.vim')
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
" denite setting
"------------------------------------------------------------
if dein#tap('denite.nvim')
	" grep setting
	if executable('rg')
		" Ripgrep command on grep source
		call denite#custom#var('grep', 'command', ['rg'])
		call denite#custom#var('grep', 'default_opts',
					\ ['--vimgrep', '--no-heading'])
		call denite#custom#var('grep', 'recursive_opts', [])
		call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
		call denite#custom#var('grep', 'separator', ['--'])
		call denite#custom#var('grep', 'final_opts', [])
	elseif executable('pt')
		" Pt command on grep source
		call denite#custom#var('grep', 'command', ['pt'])
		call denite#custom#var('grep', 'default_opts',
					\ ['--nogroup', '--nocolor', '--smart-case'])
		call denite#custom#var('grep', 'recursive_opts', [])
		call denite#custom#var('grep', 'pattern_opt', [])
		call denite#custom#var('grep', 'separator', ['--'])
		call denite#custom#var('grep', 'final_opts', [])
	elseif executable('ag')
		" Ag command on grep source
		call denite#custom#var('grep', 'command', ['ag'])
		call denite#custom#var('grep', 'default_opts',
					\ ['--vimgrep'])
		call denite#custom#var('grep', 'recursive_opts', [])
		call denite#custom#var('grep', 'pattern_opt', [])
		call denite#custom#var('grep', 'separator', ['--'])
		call denite#custom#var('grep', 'final_opts', [])
	endif
endif

"------------------------------------------------------------
" key mapping
"------------------------------------------------------------
nnoremap <SPACE> <PageDown>
nnoremap <S-SPACE> <PageUp>
nnoremap ZZ <Nop>
inoremap <C-@> <Nop>

" for Unite
if dein#tap('unite.vim')
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
"nmap <M-u> [unite]
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]o :<C-u>Unite<Space>-vertical<Space>-winwidth=40<Space>outline<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]r :<C-u>UniteResume search-buffer<CR>
endif

" for denite.nvim
" denite.nvim need python3
if dein#tap('denite.nvim')
nnoremap [denite] <Nop>
nmap <Leader>d [denite]
nnoremap <silent> [denite]b :<C-u>Denite<Space>-mode=normal -smartcase buffer<CR>
nnoremap <silent> [denite]m :<C-u>Denite<Space>-mode=normal -smartcase file_mru<CR>
nnoremap <silent> [denite]f :<C-u>Denite<Space>-mode=normal -smartcase file<CR>
nnoremap <silent> [denite]o :<C-u>Denite<Space>-mode=normal -smartcase outline<CR>
"nnoremap <silent> [denite]g :<C-u>DeniteCursorWord<Space>-mode=normal -buffer-name=search-buffer<Space>grep<CR>
nnoremap <silent> [denite]g :<C-u>Denite<Space>-mode=normal -buffer-name=search-buffer<Space>grep<CR>
nnoremap <silent> [denite]r :<C-u>Denite<Space>-mode=normal -buffer-name=search-buffer -resume<CR>
endif

" for gtags(denite or unite)
if executable('gtags')
nnoremap [gtags] <Nop>
nmap <Leader>g [gtags]
nnoremap <silent> [gtags]b :<C-u>!gtags -v<CR>
nnoremap <silent> [gtags]u :<C-u>!gtags -vi<CR>

if dein#tap('denite.nvim')
" for denite-gtags
nnoremap <silent> [gtags]a :<C-u>DeniteCursorWord<Space>-mode=normal -buffer-name=gtags_context gtags_context<CR>
nnoremap <silent> [gtags]d :<C-u>DeniteCursorWord<Space>-mode=normal -buffer-name=gtags_def gtags_def<CR>
nnoremap <silent> [gtags]r :<C-u>DeniteCursorWord<Space>-mode=normal -buffer-name=gtags_ref gtags_ref<CR>
nnoremap <silent> [gtags]g :<C-u>DeniteCursorWord<Space>-mode=normal -buffer-name=gtags_grep gtags_grep<CR>
elseif dein#tap('unite.vim')
" for unite-gtags
nnoremap <silent> [gtags]d :<C-u>Unite<Space>gtags/def<CR>
nnoremap <silent> [gtags]r :<C-u>Unite<Space>gtags/ref<CR>
nnoremap <silent> [gtags]g :<C-u>Unite<Space>gtags/grep<CR>
endif
endif


" for VimFiler
nnoremap [vimfiler] <Nop>
nmap <Leader>f [vimfiler]
nnoremap <silent> [vimfiler]e :<C-u>VimFilerExplorer<Space>-winwidth=70<Space>.<CR>

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

if has('win32')
	let howm_fileencoding='cp932'
	let howm_fileformat='dos'
else
	let howm_fileencoding='utf-8'
	let howm_fileformat='unix'
endif

let QFixHowm_ST=-9
let mygrepprg='agrep.vim'

let QFixHowm_Menufile='0000-00-00-000000.txt'
let QFixMRU_RegisterFile = '\.\(howm\|txt\|mkd\|wiki\)$'
let QFixHowm_MenuPreviewEnable=0

let qfixmemo_random_columns = 0

"------------------------------------------------------------
" show special chars
"------------------------------------------------------------
set list
" show tabs by '^' and ' '.
set listchars=tab:^\ 
"                   ^ space char is here!

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

"------------------------------------------------------------
"全角スペースを　で表示
"------------------------------------------------------------
augroup highlightDoubleByteSpace
  autocmd!
  autocmd VimEnter,Colorscheme * highlight DoubleByteSpace term=underline ctermbg=LightMagenta guibg=LightMagenta
  autocmd VimEnter,WinEnter,BufRead * match DoubleByteSpace /　/
augroup END


