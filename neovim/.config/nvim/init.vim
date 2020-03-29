".vimrc / init.vim

" set a map leader for more key combos
let mapleader = ','

"Ensure vim-plug is installed and then load it
call plug#begin('~/.config/nvim/plugged')

" General {{{
	" abbreviations
	abbr funciton function
	abbr teh the
	abbr itempalte template
	abbr fitler filter
	abbr cosnt const
	abbr attribtue attribute
	abbr attribuet attribute
	
	"{{ 
	" Finding files configuration
	" Search down into subfolders
	" Provides tab-completion for all file-related tasks
	set path+=**
	
	" Display all matching files when we tab complete
	set wildmenu " enhance command line completion
	"}}
	
	set autoread " detect when a file is changed
	set history=1000 " change history to 1000
	set textwidth=120

	if (has('nvim'))
		" show results of substitution as they're happening
		" but don't open a split
		set inccommand=nosplit
	endif

	set backspace=indent,eol,start " make backspace behave in sane manner
	set clipboard+=unnamedplus

	if has('mouse')
		set mouse=a
	endif

	" searching
	set ignorecase " case insensitive searching
	set smartcase " case sensitive if expression contains a capital letter
	set hlsearch " highlight search results
	set incsearch " set incremental search like modern browsers
	set nolazyredraw " don't redraw while executing macros

	set magic " set magic on, for macros

	" error bells
	set noerrorbells
	set visualbell
	set t_vb=
	set tm=500
" }}}

" Appearance {{{
	set number " show line numbers
	set nonu
	set relativenumber
	set rnu
	set wrap " turn on line wrapping
	set wrapmargin=8 " wrap lines when coming within n characters for side
	set linebreak " set soft wrapping
	set showbreak=... " show ellipsis at breaking
	set autoindent " automatically set indent of new line
	set cindent
	set ttyfast " faster redrawing
	set diffopt+=vertical
	set laststatus=2 " show the status line all the time
	set so=7 " set 7 lines to the cursors - when moving vertical
	set hidden " current buffer can be put into background
	set wildmode=list:longest " complete files like a shell
	set scrolloff=3 " lines of text around cursor
	set shell=$SHELL
	set cmdheight=1 " command bar height
	set showmatch " show matching braces
	set mat=2 " how many tenths of a second to blink

	" Tab control
	set noexpandtab " insert tabs rather than spaces for <Tab>
	set smarttab " tab respects 'tabstop', 'shiftwidth' and 'softtabstop'
	set tabstop=2 " the visible width of tabs
	set softtabstop=2 " edit as if the tabs are 4 characters wide
	set shiftwidth=2 " number of spaces to use for indent and unindent
	set shiftround " round indent to a multiple of 'shiftwidth'

	" code folding settings
	set foldmethod=syntax " fold based on indent
	set foldlevelstart=99
	set foldnestmax=10 " deepest fold is 10 levels
	set nofoldenable " don't fold by default
	set foldlevel=1

	" toggle invisible characters
	set list
	set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
	set showbreak=↪

	if &term =~ '256color'
		" disable background color erase
		set t_ut=
	endif

	" highlight conflicts
	match ErrorMsg '^\(<\|=\|>\)\{7\}\([^[=].\+\)\?$'

		" load colorscheme
	Plug 'joshdick/onedark.vim'
	Plug 'morhetz/gruvbox'
	" }}}

" General mappings {{{
	
	" shortcut to save
	nmap <leader>, :w<cr>

	inoremap jk <esc>

	" set paste toggle
	set pastetoggle=<leader>v

	" clear highlighted search
	noremap <space> :set hlsearch! hlsearch?<cr>

	" activate spell-checking alternatives
	nmap ;s :set invspell spelllang=en<cr>

	" markdown to html
	nmap <leader>md :%!markdown --html4tags <cr>

	" remove extra whitespace
	nmap <leader><space> :%s/\s\+$<cr>
	nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

	nmap <leader>l :set list!<cr>

	" Textmate style indentation
	vmap <leader>[ <gv
	vmap <leader>] >gv
	nmap <leader>[ <<
	nmap <leader>] >>

	" switch between current and last buffer
	nmap <leader>. <c-^>

	" enable . command in visual mode
	vnoremap . :normal .<cr>

	" easier split navigations
	nnoremap <C-h> <C-w><C-h>
	nnoremap <C-j> <C-w><C-j>
	nnoremap <C-k> <C-w><C-k>
	nnoremap <C-l> <C-w><C-l>
	
	" split window
	nmap <leader>ss :split<Return><C-w>w
	nmap <leader>sv :vsplit<Return><C-w>w

	" new tab shortcut
	nmap <leader>te :tabedit<Return>

	" switch tab
	nmap <S-Tab> :tabprev<Return>
	nmap <Tab> :tabnext<Return>
	
	" more natural split opening
	set splitbelow
	set splitright

	" toggle cursor line highlighting
	:hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
	:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
	:nnoremap <leader>i : set cursorline! cursorcolumn!<cr>
	"nnoremap <leader>i :set cursorline!<cr>

	" moving up and own work as you would expect
	nnoremap <silent> j gj
	nnoremap <silent> k gk
	nnoremap <silent> ^ g^
	nnoremap <silent> $ g$

	" scroll the viewport faster
	nnoremap <C-e> 3<C-e>
	nnoremap <C-y> 3<C-y>

" }}}

" General Functionality {{{
"
"	
	" arduino plugins
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline#extensions#tabline#enabled = 1
	
	Plug 'sudar/vim-arduino-syntax'
	Plug 'sudar/vim-arduino-snippets'
	
	" syntax highlighting ofr 6502 ACME assembler
	Plug 'leissa/vim-acme'

	"Fuzzy find files
	Plug 'kien/ctrlp.vim'
	
	" add end, endif etc automatically
	Plug 'tpope/vim-endwise'

	" detect indent style (tab vs spaces)
	Plug 'tpope/vim-sleuth'

	" insert or delete brackets, parens, quotes in pair
	Plug 'jiangmiao/auto-pairs'

	" NERDTree {{{
		Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

		augroup nerdtree
			autocmd!
			autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
			autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
		augroup END

		" toggle NERDTree
		nmap <silent> <leader>k :NERDTreeToggle<cr>
		" find the current file in nerdtree without needing to reload the drawer
		nmap <silent> <leader>y :NERDTreeFind<cr>

		let NERDTreeShowHidden=1 " show hidden files
	" }}}
	Plug 'pangloss/vim-javascript'
	Plug 'jelera/vim-javascript-syntax'
	Plug 'mattn/emmet-vim'
	" match tags in html, similar to paren support
	Plug 'gregsexton/MatchTag', { 'for': 'html' }
	
	" vim-closetag
	Plug 'alvan/vim-closetag'
		" filenames like *.xml, *.html, *.xhtml, ...
		" These are the file extensions where this plugin is enabled.
		let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

		" filenames like *.xml, *.xhtml, ...
		" This will make the list of non-closing tags self-closing in the specified files.
		"
		let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

		" filetypes like xml, html, xhtml, ...
		" These are the file types where this plugin is enabled.
		"
		let g:closetag_filetypes = 'html,xhtml,phtml'

		" filetypes like xml, xhtml, ...
		" This will make the list of non-closing tags self-closing in the specified files.
		"
		let g:closetag_xhtml_filetypes = 'xhtml,jsx'

		" integer value [0|1]
		" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
		let g:closetag_emptyTags_caseSensitive = 1

		" Shortcut for closing tags, default is '>'
		let g:closetag_shortcut = '>'

		" Add > at current position without closing the current tag, default is ''
		"
		let g:closetag_close_shortcut = '<leader>>'
	" }}}
	
call plug#end()
	if exists('$TMUX')
		let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
		let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
		let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
	else
		let &t_SI = "\e[6 q"
		let &t_SR = "\e[4 q"
		let &t_EI = "\e[2 q"
	endif

" Colorscheme and final setup {{{
	"let g:seoul256_background=233
	set background=dark
	colorscheme gruvbox
		
	syntax on
	filetype plugin indent on

	" make the highlighting of tabs and other non-text less annoying
	highlight SpecialKey ctermfg=14 guifg=#333333
	highlight NonText ctermfg=darkgray guifg=#333333


	" make background transparent
	hi Normal guibg=NONE ctermbg=none

	" vim status bar inactive color
	hi StatusLineNC guibg=#0b0b0b ctermfg=white ctermbg=darkgray cterm=NONE gui=NONE
	
	" vim tabs colors
	"hi TabLineFill guibg=#0b0b0b ctermfg=LightGreen ctermbg=DarkGreen
	"hi TabLine guibg=#1b1b1b ctermfg=Blue ctermbg=Yellow
	"hi TabLineSel guibg=#3b3b3b ctermfg=Red ctermbg=Yellow
	hi ShowMatches cterm=none ctermbg=darkgray ctermfg=white
	autocmd BufNewFile,BufRead *.asm set syntax=acme.vim
"}}}
