scriptencoding utf-8

" need to set `encoding=utf-8` for using `denite.nvim`.
set encoding=utf-8

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

"execute 'source' $DOTVIM.'/neobundle_rc.vim'
execute 'source' $DOTVIM.'/dein_rc.vim'

"------------------------------------------------------------
" vim-gitgutter setting
"------------------------------------------------------------
set updatetime=1000

if dein#tap('defx.nvim')
    "------------------------------------------------------------
    " Defx setting
    "------------------------------------------------------------
    autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
        " Define mappings
        nnoremap <silent><buffer><expr> <CR>
                    \ defx#do_action('drop')
        nnoremap <silent><buffer><expr> c
                    \ defx#do_action('copy')
        nnoremap <silent><buffer><expr> m
                    \ defx#do_action('move')
        nnoremap <silent><buffer><expr> p
                    \ defx#do_action('paste')
        nnoremap <silent><buffer><expr> l
                    \ defx#do_action('drop')
        nnoremap <silent><buffer><expr> E
                    \ defx#do_action('open', 'vsplit')
        nnoremap <silent><buffer><expr> P
                    \ defx#do_action('preview')
        nnoremap <silent><buffer><expr> o
                    \ defx#do_action('open_tree', 'toggle')
        nnoremap <silent><buffer><expr> O
                    \ defx#do_action('close_tree')
        nnoremap <silent><buffer><expr> K
                    \ defx#do_action('new_directory')
        nnoremap <silent><buffer><expr> N
                    \ defx#do_action('new_file')
        nnoremap <silent><buffer><expr> M
                    \ defx#do_action('new_multiple_files')
        nnoremap <silent><buffer><expr> C
                    \ defx#do_action('toggle_columns',
                    \                'mark:indent:icon:filename:type:size:time')
        nnoremap <silent><buffer><expr> S
                    \ defx#do_action('toggle_sort', 'time')
        nnoremap <silent><buffer><expr> d
                    \ defx#do_action('remove')
        nnoremap <silent><buffer><expr> r
                    \ defx#do_action('rename')
        nnoremap <silent><buffer><expr> !
                    \ defx#do_action('execute_command')
        nnoremap <silent><buffer><expr> x
                    \ defx#do_action('execute_system')
        nnoremap <silent><buffer><expr> yy
                    \ defx#do_action('yank_path')
        nnoremap <silent><buffer><expr> .
                    \ defx#do_action('toggle_ignored_files')
        nnoremap <silent><buffer><expr> ;
                    \ defx#do_action('repeat')
        nnoremap <silent><buffer><expr> h
                    \ defx#do_action('cd', ['..'])
        nnoremap <silent><buffer><expr> ~
                    \ defx#do_action('cd')
        nnoremap <silent><buffer><expr> q
                    \ defx#do_action('quit')
        nnoremap <silent><buffer><expr> <Space>
                    \ defx#do_action('toggle_select') . 'j'
        nnoremap <silent><buffer><expr> *
                    \ defx#do_action('toggle_select_all')
        nnoremap <silent><buffer><expr> j
                    \ line('.') == line('$') ? 'gg' : 'j'
        nnoremap <silent><buffer><expr> k
                    \ line('.') == 1 ? 'G' : 'k'
        nnoremap <silent><buffer><expr> <C-l>
                    \ defx#do_action('redraw')
        nnoremap <silent><buffer><expr> <C-g>
                    \ defx#do_action('print')
        nnoremap <silent><buffer><expr> cd
                    \ defx#do_action('change_vim_cwd')
        nnoremap <silent><buffer><expr> > 
                    \ defx#do_action('resize', defx#get_context().winwidth + 10)
        nnoremap <silent><buffer><expr> < 
                    \ defx#do_action('resize',defx#get_context().winwidth - 10)
    endfunction

    call defx#custom#option('_', {
                \ 'winwidth': 50,
                \ 'split': 'vertical',
                \ 'direction': 'topleft',
                \ 'buffer_name': 'explorer',
                \ 'toggle': 1,
                \ 'resume': 1,
                \ })
elseif dein#tap('vimfiler')
    "------------------------------------------------------------
    " VimFiler setting
    "------------------------------------------------------------
    let g:vimfiler_as_default_explorer = 1
endif

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
					\ ['--vimgrep', '--no-heading', '--smart-case'])
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

	" file_rec setting
	let ignore=&wildignore .  ',*.pyc,.git,.hg,.svn'
	call denite#custom#var('file_rec', 'command', ['scantree.py', '--ignore', ignore])

	if has('win32')
		let g:python3_host_prog=$VIM."\\python.exe"
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
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]f :<C-u>Unite file<CR>
nnoremap <silent> [unite]o :<C-u>Unite -vertical -winwidth=40 outline<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]r :<C-u>UniteResume search-buffer<CR>
endif

" for denite.nvim
" denite.nvim need python3
if dein#tap('denite.nvim')
    " Define mappings
    autocmd FileType denite call s:denite_my_settings()
    function! s:denite_my_settings() abort
        nnoremap <silent><buffer><expr> <CR>
                    \ denite#do_map('do_action')
        nnoremap <silent><buffer><expr> d
                    \ denite#do_map('do_action', 'delete')
        nnoremap <silent><buffer><expr> p
                    \ denite#do_map('do_action', 'preview')
        nnoremap <silent><buffer><expr> q
                    \ denite#do_map('quit')
        nnoremap <silent><buffer><expr> i
                    \ denite#do_map('open_filter_buffer')
        nnoremap <silent><buffer><expr> <Space>
                    \ denite#do_map('toggle_select').'j'
    endfunction

    autocmd FileType denite-filter call s:denite_filter_my_settings()
    function! s:denite_filter_my_settings() abort
        imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
    endfunction

    nnoremap [denite] <Nop>
    nmap <Leader>d [denite]
    nnoremap <silent> [denite]b :<C-u>Denite -direction=dynamicbottom -auto-resize -smartcase buffer<CR>
    nnoremap <silent> [denite]m :<C-u>Denite -direction=dynamicbottom -auto-resize -smartcase file_mru<CR>
    nnoremap <silent> [denite]f :<C-u>Denite -direction=dynamicbottom -auto-resize -smartcase file/rec<CR>
    nnoremap <silent> [denite]o :<C-u>Denite -direction=dynamicbottom -auto-resize -smartcase outline<CR>
    nnoremap <silent> [denite]g :<C-u>Denite -direction=dynamicbottom -auto-resize -no-empty -buffer-name=search-buffer grep<CR>
    nnoremap <silent> [denite]r :<C-u>Denite -direction=dynamicbottom -auto-resize -buffer-name=search-buffer -resume<CR>
endif

" for gtags(denite or unite)
if executable('gtags')
nnoremap [gtags] <Nop>
nmap <Leader>g [gtags]
"nnoremap <silent> [gtags]b :<C-u>!gtags -v<CR>
"nnoremap <silent> [gtags]u :<C-u>!gtags -vi<CR>
nnoremap <silent> [gtags]b :<C-u>!gtags -v --gtagslabel=pygments<CR>
nnoremap <silent> [gtags]u :<C-u>!gtags -vi --gtagslabel=pygments<CR>

if dein#tap('denite.nvim')
" for denite-gtags
nnoremap <silent> [gtags]a :<C-u>DeniteCursorWord -direction=dynamicbottom -auto-resize -buffer-name=gtags_context gtags_context<CR>
nnoremap <silent> [gtags]d :<C-u>DeniteCursorWord -direction=dynamicbottom -auto-resize -buffer-name=gtags_def gtags_def<CR>
nnoremap <silent> [gtags]r :<C-u>DeniteCursorWord -direction=dynamicbottom -auto-resize -buffer-name=gtags_ref gtags_ref<CR>
nnoremap <silent> [gtags]g :<C-u>DeniteCursorWord -direction=dynamicbottom -auto-resize -buffer-name=gtags_grep gtags_grep<CR>
elseif dein#tap('unite.vim')
" for unite-gtags
nnoremap <silent> [gtags]d :<C-u>Unite gtags/def<CR>
nnoremap <silent> [gtags]r :<C-u>Unite gtags/ref<CR>
nnoremap <silent> [gtags]g :<C-u>Unite gtags/grep<CR>
endif
endif

if dein#tap('fern.vim')
nnoremap [fern] <Nop>
nmap <Leader>f [fern]
nnoremap <silent> [fern]e :<C-u>Fern . -drawer -reveal=% -width=50 -keep -toggle<CR>
nnoremap <silent> [fern]h :<C-u>Fern %:h<CR>
elseif dein#tap('defx.nvim')
" for Defx
nnoremap [defx] <Nop>
nmap <Leader>f [defx]
nnoremap <silent> [defx]e :<C-u>Defx<CR>
nnoremap <silent> [defx]c :<C-u>Defx -no-resume<CR>
elseif dein#tap('vimfiler')
" for VimFiler
nnoremap [vimfiler] <Nop>
nmap <Leader>f [vimfiler]
nnoremap <silent> [vimfiler]e :<C-u>VimFilerExplorer -winwidth=50<CR>
endif

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
"let g:sonokai_style = 'shusia'
"let g:sonokai_style = 'andromeda'
let g:sonokai_style = 'atlantis'
"let g:sonokai_style = 'maia'
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai
"colorscheme PaperColor
