	set number 				" turn on line numbers and highlight colors
	set relativenumber			" use relative numbers except for current line
	set ruler 				" Always show current positions along the bottom
	set showcmd 				" show the command being typed
	set autoindent 				" autoindent spaces
	set cursorline
	set nocursorcolumn
	set nocursorline
	syntax sync minlines=256


"	inoremap ;; <esc>			" fbind ;; to esecape key 
	set t_Co=16				" 256 colors 
	nmap <C-h> <C-w>h			" control h, j, k, l tab navigation
	nmap <C-j> <C-w>j
	nmap <C-k> <C-w>k
	nmap <C-l> <C-w>l
	syntax enable
	colorscheme default
	set background=dark
"	set nowrap
"	set mouse=a 				" use mouse anywhere
	set autoread 				" Set to auto read when a file is changed from the outside

	filetype plugin indent on
	
	au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown

	set undofile
	set undodir=~/.vim/undo			" where to save undo histories
	set undolevels=1000			" how many undos
	set undoreload=10000			" number of lines to save for undo
	set backupdir=~/.vim/backup/
	set directory=~/.vim/backup/

	nnoremap / /\v
	vnoremap / /\v
	


" COLORS {
	" syntax highlighting groups
	hi Comment      ctermfg=7
	hi Constant     ctermfg=15 
	hi Identifier   ctermfg=4
	hi Statement    ctermfg=8
	hi PreProc      ctermfg=6
	hi Type         ctermfg=1
	hi Special      ctermfg=3
	hi Underlined   ctermfg=7
	hi Ignore       ctermfg=9
	hi Error        ctermfg=11
	hi Todo         ctermfg=1
	hi Normal ctermfg=none ctermbg=none
	hi NonText ctermfg=0 ctermbg=none
	hi Directory	ctermfg=12
	
	hi VertSplit	ctermfg=0 ctermbg=none
	hi StatusLine	ctermfg=0 ctermbg=none
	hi StatusLineNC	ctermfg=0 ctermbg=none
	
	hi Folded ctermbg=0 ctermfg=8

	hi Pmenu ctermfg=7 ctermbg=0
	hi PmenuSel ctermfg=0 ctermbg=15
	hi LineNr ctermfg=0 ctermbg=none
	hi CursorLine ctermfg=none ctermbg=none cterm=none
	hi CursorLineNr ctermfg=none ctermbg=0 
	hi CursorColumn ctermfg=none ctermbg=0

	" Syntax checker colors
	highlight SignColumn ctermbg=none
	hi SyntasticErrorSign ctermfg=1 ctermbg=none
	hi SyntasticWarningSign ctermfg=3 ctermbg=none
	hi SyntasticStyleErrorSign ctermfg=1 ctermbg=none
	hi SyntasticStyleWarningSign ctermfg=3 ctermbg=none
	hi SyntasticErrorLine ctermfg=none ctermbg=none
	hi SyntasticWarningLine ctermfg=none ctermbg=none
	hi SyntasticStyleErrorLine ctermfg=none ctermbg=none
	hi SyntasticStyleWarningLine ctermfg=none ctermbg=none
	hi SpellBad ctermfg=0 ctermbg=3
	hi SpellCap ctermfg=0 ctermbg=1

"}

" PLUGINS {
	call pathogen#infect()
	call pathogen#helptags()

" EASYALIGN
        " Start interactive EasyAlin in visual mode (e.g. vip<Enter>)
        vmap <Enter> <Plug>(EasyAlign)
	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
	nmap ga <Plug>(EasyAlign)

" NERDTREE
	let NERDChristmasTree = 1
	let NERDTreeHighlightCursorline = 1

" LIGHTLINE
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
"}

" WORD PROCESSING {
	set formatoptions=1
	set lbr
	set linebreak
	set wrap
	au BufRead,BufNewFile *.todo setfiletype todo


	cabbr wp call Wp()
	fun! Wp()
		set formatoptions=1
		set lbr
		set linebreak
		set wrap
		set nonumber
		nnoremap j gj
		nnoremap k gk
		nnoremap 0 g0
		nnoremap $ g$
		set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:[+],fb:[x],fb:[-]
		set comments +=fb:-
		set spell spelllang=en_us

	endfu

	" Search for selected text, forwards or backwards.
	vnoremap <silent> * :<C-U>
	  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
	  \gvy/<C-R><C-R>=substitute(
	  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
	  \gV:call setreg('"', old_reg, old_regtype)<CR>
	vnoremap <silent> # :<C-U>
	  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
	  \gvy?<C-R><C-R>=substitute(
	  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
	  \gV:call setreg('"', old_reg, old_regtype)<CR>
"}
