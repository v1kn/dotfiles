
"   VIM-PLUG [-
"   ========

set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'wincent/ferret'
Plug 'junegunn/goyo.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'tomtom/tcomment_vim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-tmuxify'
Plug 'tpope/vim-unimpaired'
"Plug 'rking/ag.vim'
"Plug 'chriskempson/base16-vim'
"Plug 'kien/ctrlp.vim'
"Plug 'ctrlpvim/ctrlp.vim'
"PLug 'Raimondi/delimitMate'
"Plug 'Konfekt/FastFold'
"Plug 'haya14busa/incsearch.vim'
"Plug 'itchyny/lightline.vim
"PLug 'Shougo/neocomplete.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'chrisbra/NrrwRgn'
"Plug 'rbgrouleff/bclose.vim' | Plug 'francoiscabrol/ranger.vim' (for nvim)
"Plug 'rstacruz/sparkup'
"Plug 'tweekmonster/spellrotate.vim'
"PLug AndrewRadev/splitjoin'
"Plug 'keith/swift.vim'
"Plug 'scrooloose/syntastic'
"Plug 'godlygeek/tabular'
"Plug 'airblade/targets.vim'
"Plug 'SirVer/utilsnips' | Plug 'honza/vim-snippets'
"Plug 'FooSoft/vim-argwrap'
"Plug 'ntpeters/vim-better-whitespace'
"Plug 'tpope/vim-characterize'
"Plug 'tpope/vim-commentary'
"Plug 'danielbmarques/vim-dialect'
"Plug 'danielbmarques/vim-ditto'
"Plug 'junegunn/vim-easy-align'
"Plug 'svermeulen/vim-easyclip'
"Plug 'tommcdo/vim-exchange'
"Plug 'tpope/vim-flagship'
"Plug 'lervag/vimtex'
"Plug 'fatih/vim-go'
"Plug 'henrik/vim-indexed-search'
"Plug 'suan/vim-instant-markdown'
"Plug 'xuhdev/vim-latex-live-preview'
"Plug 'tommcdo/vim-lion'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'tpope/vim-obsession'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'vim-pandoc/vim-pandoc-after'
"Plug 'sheerun/vim-polyglot'
"Plug 'tpope/vim-repeat'
"Plug 'mhinz/vim-sayonara'
"Plug 'tpope/vim-sensible'
"Plug 'justinmk/vim-sneak'
"Plug 'garbas/vim-snipmate'
"Plug 'kana/vim-textobj-user'
"Plug 'kana/vim-textobj-line'
"Plug 'kana/vim-textobj-indent'
"Plug 'kana/vim-textobj-entire'
"Plug 'kana/vim-textobj-syntax'
"Plug 'tpope/vim-tbone'
"Plug 'nelstrom/vim-visual-star-search'
"Plug 'maxbrunsfeld/vim-yankstack'

call plug#end()
"-]
"   PLUGIN CONFIG [-
"   =============

"   Lightline [-
"   ---------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction
""-]
"   AIRLINE [-
"   -------
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
"let g:airline_left_sep = ''
let g:airline_left_sep = '|'
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
let g:airline_right_sep = '|'
"let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
""-]
"   CtrlP [-
"   -----
let g:ctrlp_show_hidden = 1
""-]
"   Gitgutter [-

"let g:gitgutter_map_keys = 0

""-]
"   Goyo [-
"   ----
let g:goyo_linenr = 1
""-]
"   Nerdtree [-
"   --------
let NERDTreeShowHidden=1
""-]
"   Startify [-
"   --------
let g:startify_list_order = ['files']
let g:startify_files_number = 20
let g:startify_update_oldfiles = 0
let g:startify_enable_unsafe = 1
let g:startify_custom_header = []
""-]
"   Syntastic [-
"   ---------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_loc_list_height = 5
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_javascript_checkers = ['eslint']

"let g:syntastic_error_symbol = '❌'
"let g:syntastic_style_error_symbol = '⁉️'
"let g:syntastic_warning_symbol = '⚠️'
"let g:syntastic_style_warning_symbol = '💩'

"highlight link SyntasticErrorSign SignColumn
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn
 ""-]
"   Vim-instant-markdown [-
"   --------------------

"let g:instant_markdown_autostart = 0
""-]
"-]
"   BASIC CONFIG [-
"   ============

filetype plugin indent on
"   swap, undos and backups, viminfo
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
set viminfo+=n~/.vim/viminfo
"   lines
set cursorline
set number                  " line numbers
set relativenumber          " relative line numbers
set ruler                   " line position
set scrolloff=10            " smallest distance from bottom line
set breakindent             " keeps indentation of new lines when indenting
"   commands
set history=50              " set a limit for history of searches and commands
set showcmd                 " command display in BR corner
set cmdheight=2             " enhanced statusbar
set laststatus=2            " enhanced statusbar
set wildmenu
set wildmode=longest,list,full
set wildignorecase
"   wrapping
set wrap                    " non-destructive wrap according to window size
set linebreak               " break lines on non-words
set nolist                  " list would turn off linebreak
set textwidth=80            " wrap to 80 chars, when fo+=t is set
set colorcolumn=80          " show 80 char mark
set formatoptions=cqmM      " turn off automatic wrapping, enable multibyte
                                " searching
set hlsearch                " search highlight
set incsearch               " display match for pattern when halfway typing it
set ignorecase              " ignore case while searching
set smartcase               " ignore case while searching
"   syntax
syntax on
syntax enable
"   modes
set timeoutlen=1000         " fix delay in switching between modes
set ttimeoutlen=0           " fix delay in switching between modes
set backspace=indent,eol,start  " enabling backspace in insert mode
set t_ut=                   " allows for ctrl-arrow in visual mode
"   tabs
set shiftwidth=4            " nr of spaces used for autoindenting
set softtabstop=4           " pretend like spaces are a tab when pressing <BS>
set expandtab
"   colorscheme related
set termguicolors           " true colors in terminals that support it
let g:solarized_termtrans=0 " non-transparent background
set background=dark
colorscheme solarized8_dark
"   misc
set gdefault                " the /g flag on :s substitutions by default
set confirm                 " confirming saving changes
set hidden                  " hide buffers but do not close them
set showmatch               " show matching brackets
set clipboard^=unnamedplus  " clipboard integration with +
"   GUI settings
if has('gui_running')
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 11
    set lines=50 columns=90
endif

" set term=xterm-256color       " set $TERM to xterm256
" set t_Co=256
"set listchars="eol:$,tab"
" set formatprg=par\ -w70       " better external text processor
"-]
"   KEY MAPPINGS [-
"   ============

"   leader
let mapleader = "\<Space>"

"   colorscheme swapping
nnoremap <leader>sd :colorscheme solarized8_dark<CR>
nnoremap <leader>sl :colorscheme solarized8_light<CR>
nnoremap <leader>gb :colorscheme gruvbox<CR>
nnoremap <leader>ap :colorscheme apprentice<CR>
nnoremap <leader>bd :colorscheme base16-default<CR>
nnoremap <leader>hb :colorscheme hybrid<CR>
nnoremap <leader>ds :colorscheme disciple<CR>
nnoremap <leader>bgd :set background=dark<CR>
nnoremap <leader>bgl :set background=light<CR>

"   jj in insert mode exits to normal mode
inoremap jj <ESC>

"   save read-only files with sudo
cmap w!! w !sudo tee > /dev/null %

"   reload vimrc
nnoremap <leader>r :source %<CR>

"   save a file
nnoremap <leader>w :w<CR>

"   <C-L> to turn off search highlighting
nnoremap <C-L> :nohl<CR><C-L>

"   F5 to choose buffer from list
nnoremap <F5> :buffers<CR>:buffer<Space>

"   newlines in normal mode
nnoremap <leader>i O<Esc>
nnoremap <leader>k O<Esc>j
nnoremap <leader>o o<Esc>k
nnoremap <leader>l o<Esc>

"   invoke bash template
nnoremap <leader>b :call Bash()<CR>
nnoremap <leader>m :call Mdown()<CR>

"   syntax highlighting for bash and markdown
nnoremap <leader>sh :set syntax=sh<CR>

"   rust
au BufNewFile,BufRead *.rs set filetype=rust

"   manipulating clipboard  pastes
vmap <leader>y "+y
vmap <leader>d "+d
vmap <leader>p "+p
vmap <leader>P "+P
nmap <leader>p "+p
nmap <leader>P "+P

"   select previously pasted text, or read into the buffer via :r!
nnoremap gV `[V`]

"   toggle set paste
set pastetoggle=<F6>

"   plugin mappings
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>gs :Gstatus<CR>
"-]
"   THEMING [-
"   =======

"   highlight double white space in markdown
highlight TrailingSpaces ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight TrailingSpaces
    \ ctermbg=darkgreen guibg=darkgreen
match TrailingSpaces /\s\{2}$/

"   linenr and cursorline highlights
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
    \ gui=NONE guifg=DarkGrey guibg=NONE
highlight Cursorline cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

"   Italics in comments (solorscheme has to allow it)
highlight Comment cterm=italic
"-]
"   COMMANDS AND FUNCTIONS [-
"   ======================

"   folding in vimrc and bash
autocmd FileType vim,sh setlocal foldmethod=marker
autocmd FileType vim,sh setlocal foldmarker=[-,-]

"   remove trailing white space
command! Nows :%s/\s\+$//

"   unknownn
" nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

command! Showmark :InstantMarkdownPreview

"   remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml
    \ autocmd BufWritePre <buffer> :call
    \ setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"   testing function for reading logfiles
function! Tailf()
    while 1
        e
        normal G
        redraw
        sleep 1
    endwhile
endfunction

"   invoke bash template
function! Bash()
    :read ~/.vim/templates/bash.cpp
    set syntax=sh
    normal gg
    normal dd
    normal G
    normal o
    normal o
endfunction

function! Mdown()
    :read ~/.vim/templates/mdown.cpp
    set syntax=md
    normal gg
    normal dd
    normal G
    normal o
    normal o
endfunction
"-]
"   EXPERIMENTAL [-
"   ============

" Follow symlinks when opening a file (git + fugitive)
" NOTE: this happens with directory symlinks anyway (due to Vim's chdir/getcwd
"       magic when getting filenames).
"  - https://github.com/tpope/vim-fugitive/issues/147#issuecomment-7572351
"  - http://www.reddit.com/r/vim/comments/yhsn6/is_it_possible_to_work_around_the_symlink_bug/c5w91qw
function! MyFollowSymlink(...)
   if exists('w:no_resolve_symlink') && w:no_resolve_symlink
     return
   endif
   let fname = a:0 ? a:1 : expand('%')
   if fname =~ '^\w\+:/'
     " Do not mess with 'fugitive://' etc.
     return
   endif
   let fname = simplify(fname)

   let resolvedfile = resolve(fname)
   if resolvedfile == fname
     return
   endif
   let resolvedfile = fnameescape(resolvedfile)
   let sshm = &shm
   set shortmess+=A  " silence ATTENTION message about swap file (would get displayed twice)
   exec 'file ' . resolvedfile
   let &shm=sshm

   " Re-init fugitive.
   call fugitive#detect(resolvedfile)
   if &modifiable
     " Only display a note when editing a file, especially not for `:help`.
     redraw  " Redraw now, to avoid hit-enter prompt.
     echomsg 'Resolved symlink: =>' resolvedfile
   endif
 endfunction
 command! FollowSymlink call MyFollowSymlink()
 command! ToggleFollowSymlink let w:no_resolve_symlink =
    \ !get(w:, 'no_resolve_symlink', 0) | echo "w:no_resolve_symlink =>"
    \ w:no_resolve_symlink
 au BufReadPost * nested call MyFollowSymlink(expand('%'))
"-]
