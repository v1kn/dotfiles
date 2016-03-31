
"MENU:
"----------<VIM-PLUG> [-
"-----------------------

set nocompatible
call plug#begin('~/.vim/plugged')

"Plug 'rking/ag.vim'
Plug 'chriskempson/base16-vim'
"Plug 'kien/ctrlp.vim'
Plug 'wincent/ferret'
Plug 'junegunn/goyo.vim'
Plug 'francoiscabrol/ranger.vim'
"Plug 'rbgrouleff/bclose.vim' | Plug 'francoiscabrol/ranger.vim' (for nvim)
"Plug 'scrooloose/syntastic'
"Plug 'godlygeek/tabular'
"Plug 'airblade/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'tpope/vim-characterize'
"Plug 'tpope/vim-commentary'
"Plug 'svermeulen/vim-easyclip'
"Plug 'tpope/vim-flagship'
"Plug 'tpope/vim-fugitive'
"Plug 'fatih/vim-go'
"Plug 'suan/vim-instant-markdown'
"Plug 'xuhdev/vim-latex-live-preview'
Plug 'plasticboy/vim-markdown'
"Plug 'tpope/vim-obsession'
"Plug 'tpope/vim-repeat'
"Plug 'mhinz/vim-sayonara'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-tbone'
Plug 'mhinz/vim-tmuxify'
Plug 'tpope/vim-unimpaired'
"Plug 'lervag/vimtex'

call plug#end()
"-]

"----------<PLUGIN CONFIG> [-1
"----------------------------

"---------------<GOYO> [-2
let g:goyo_linenr = 1

 "-]2
"---------------<CTRLP> [-2
let g:ctrlp_show_hidden = 1

"-]2
"---------------<AIRLINE> [-2
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
"-]2
"---------------<SYNTASTIC> [-2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
"-]2
"---------------<STARTIFY> [-2
let g:startify_list_order = ['files']
let g:startify_files_number = 20
let g:startify_update_oldfiles = 0
let g:startify_enable_unsafe = 1
let g:startify_custom_header = []
"-]2
"-]1

"----------<BASIC CONFIG> [-
"---------------------------

filetype plugin indent on

" set $TERM to xterm256
set term=xterm-256color

" folding in vimrc and bash
autocmd FileType vim,sh setlocal foldmethod=marker
autocmd FileType vim,sh setlocal foldmarker=[-,-]

" swap, undos and backups
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" permanent line numbers
set number

" enabling backspace in insert mode
set backspace=indent,eol,start

" set a limit for history of searches and commands
set history=50

" line position
set ruler

" command display in lower right corner, enhanced statusbar
set showcmd
set cmdheight=2
set laststatus=2

" distance between working line and last visible line
set scrolloff=10

" keeps indentation of new lines while indenting
set breakindent

" display match for search pattern when halwfay typing it
set incsearch

" syntax and search highlights
syntax on
syntax enable
set hlsearch

" better command line completion
set wildmenu
set wildmode=longest,list,full
set wildignorecase

" ignore case while searching
set ignorecase
set smartcase

" the /g flag on :s substitutions by default
set gdefault

" confirming saving changes
set confirm

" hide buffers, not close them
set hidden

" show invisible chars as a $ sign
set wrap
set linebreak
"set nolist
"set listchars="eol:$,tab"

"show matching brackets
set showmatch

"fighting delay in between modes
set timeoutlen=1000
set ttimeoutlen=0

"Ctrl-arrow during visual mode
set t_ut=

" spaces of 4 instead of tabs
set shiftwidth=4
set softtabstop=4
set expandtab

"clipboard settings
set clipboard=unnamed

"-]

"----------<KEY MAPPINGS> [-
"---------------------------

" map the leader
"let mapleader = ","
let mapleader = "\<Space>"

" map <C-L> to also turn off search highlighting
nnoremap <C-L> :nohl<CR><C-L>

" select previously pasted text, or read into the buffer via :r!
nnoremap gV `[V`]

    " use F5 to choose a buffer from the list
nnoremap <F5> :buffers<CR>:buffer<Space>

" enter and shift-enter as a newline in normal mode
"nmap <CR> o<Esc>

" enable jj in insert mode to exit to normal mode
inoremap jj <ESC>

" save read-only files with sudo
cmap w!! w !sudo tee > /dev/null %

" shift enter adds a newline without moving the cursor
"nmap <C-o> O<Esc>
"nmap <C-l> o<Esc>
nnoremap <leader>i O<Esc>
nnoremap <leader>k O<Esc>j
nnoremap <leader>o o<Esc>k
nnoremap <leader>l o<Esc>

"-]

"----------<THEMING> [-
"----------------------

" highlight double white space in markdown
highlight TrailingSpaces ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight TrailingSpaces ctermbg=darkgreen guibg=darkgreen
match TrailingSpaces /\s\{2}$/

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

highlight Cursorline cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

set cursorline

"let g:solarized_termcolors=256

let g:solarized_termtrans=0

set t_Co=256

colorscheme solarized

highlight Comment cterm=italic

set background=dark

"-]

"----------<COMMANDS AND FUNCTIONS> [-
"-------------------------------------

" remove trailing white space
command Nows :%s/\s\+$//
command Showmark :InstantMarkdownPreview

" remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" testing function for reading logfiles
function! Tailf()
    e
    normal G
    redraw

    sleep 1
    call Tailf()
endfunction

"-]1

"----------<EXPERIMENTAL> [-1
"---------------------------

" better external text formatter
"set formatprg=par\ -w70

" wrapping
"set formatoptions+=t
"set textwidth=70
"set wrapmargin=10

"-]1
