syntax on
filetype plugin indent on
set hidden
set nobackup
set nowritebackup
set guicursor=
set nowrap
set number
set nu
set relativenumber
set rnu
set wrap
set wrapmargin=8
set linebreak
set showbreak=...
set smartindent
set cindent
set diffopt+=vertical
set laststatus=2
set so=7 " set 7 lines to the cursors - when moving vertical
set hidden " current buffer can be put into background
set wildmode=list:longest " complete files like a shell
set scrolloff=3 " lines of text around cursor
set shell=$SHELL
set cmdheight=2 " command bar height
set showmatch " show matching braces
set updatetime=50
set undofile
set undodir=~/.config/nvim/undodir
set noswapfile
set wildmenu
set path+=** " Provides tab-completion for all file-related tasks
set autoread " detect when a file is changed
set history=1000 " change history to 1000
set textwidth=120
set backspace=indent,eol,start " make backspace behave in sane manner
set clipboard+=unnamedplus
set nolazyredraw " don't redraw while executing macros
set shortmess+=c

" searching
set ignorecase " case insensitive searching
set smartcase " case sensitive if expression contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search like modern browsers

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Tab control
set expandtab
set smarttab " tab respects 'tabstop', 'shiftwidth' and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
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

" more natural split opening
set splitbelow
set splitright

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 30

" toggle cursor line highlighting
:hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=darkgrey

if has('mouse')
	set mouse=a
endif

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^[=].\+\)\?$'

call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'morhetz/gruvbox'
  Plug 'kien/ctrlp.vim'
  Plug 'tpope/vim-sleuth'
  Plug 'vim-airline/vim-airline'
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tabline#enabled = 1
call plug#end()

" Colorscheme and final setup {{{
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermfg=14 guifg=#333333
highlight NonText ctermfg=darkgray guifg=#333333

" make background transparent
"hi Normal guibg=NONE ctermbg=none

" vim status bar inactive color
hi StatusLineNC guibg=#0b0b0b ctermfg=white ctermbg=darkgray cterm=NONE gui=NONE

" vim tabs colors
hi ShowMatches cterm=none ctermbg=darkgray ctermfg=white

source ~/.config/nvim/keymaps.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/nerdtree.vim
