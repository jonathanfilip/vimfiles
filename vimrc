" Vim configuration file
" Author: Jonathan Filip


" Setup: {{{1 ================================================================

set encoding=utf-8

" Set location so we can set variables accordingly
let g:os = "linux"
if has("win32") || has("win64")
    let g:os="win"
endif


" Settings: {{{1 =============================================================

set browsedir=buffer
set hidden
set history=1000
set mouse=a 
set shortmess=filmnrxoOtTI

set backspace=indent,eol,start
set confirm
set foldmethod=manual
set formatoptions=tcrqn
set nojoinspaces
set nowrap 
set nrformats-=octal
set scrollopt=jump,ver,hor
set sidescroll=10
set splitbelow
set splitright
set virtualedit=block
set whichwrap+=<,>,h,l

" Terminal
if !has("gui_running")
    set t_Co=256
    set term=xterm-256color
    set ttymouse=xterm2
endif

" Use system clipboard
if has("clipboard")
    set clipboard=unnamed
    " set clipboard=
endif
set clipboard=unnamed

if g:os != "win"
    set shellslash
endif

syntax on

set tags=./tags;/.

if version >= 703
    set cryptmethod=blowfish
endif


" UI Settings: {{{2 ----------------------------------------------------------

set cmdheight=1
set cursorline
set fillchars=
set guioptions=egc
set laststatus=2
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set noequalalways
set noerrorbells 
set novisualbell
set ruler 
set showcmd
set showmatch
set showmode
set showtabline=1
set statusline=%<%f\ %h%m%r%y[%{&ff}]%=%-14.(%l,%c%V%)\ %P
set synmaxcol=1000
set winminheight=0 
set winminwidth=0

if has("gui_running")
    set title
    if g:os == "osx"
        set lines=80 columns=200 fuoptions=maxvert,maxhorz
    else
        set lines=60 columns=160
    endif
    if has("gui_win32") || has ("gui_win64")
        set guifont=Consolas:h10
    elseif has("gui_macvim")
        set guifont=Consolas:h13
    endif
else
    set guioptions+=aA
endif


" Search Settings: {{{2 ------------------------------------------------------

set ignorecase 
set incsearch 
set nohlsearch 
set smartcase


" Indentation Settings: {{{2 -------------------------------------------------

set autoindent
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set expandtab 
set smarttab 
set shiftround


" Completion Settings: {{{2 --------------------------------------------------

set complete=.,w,b,u
set completeopt=longest,menu
set wildmenu 
set wildmode=list:longest,full


" File Settings: {{{2 --------------------------------------------------------

filetype plugin indent on
set autoread
set fileformats=unix,dos
set nobackup 
set nowritebackup 
set noswapfile


" Wild Ignore Settings: {{{2 -------------------------------------------------

set wildignore+=*.pyc,*.pyd,*.pyo " python files
set wildignore+=*.bmp,*.gif,*.ico,*.png,*.jpg,*.jpeg " images
set wildignore+=*.csproj,*.pdb,*.resx,*.sln,*.suo " visual studio
set wildignore+=*.doc,*.docx,*.pdf,*.xls,*.xlsx " documents
set wildignore+=*.dll,*.exe,*.lib,*.map,*.o,*.obj,*.so " binaries
set wildignore+=*.h5,*.gz " compressed files
set wildignore+=*.bak,*~,tmp " misc files
set wildignore+=.svn\*,.git\* " scm
set wildignore+=cscope.out,tags " vim


" Mappings: {{{1 =============================================================

let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"
"let g:mapleader = ";"
"let g:maplocalleader = ";"

" Indenting in visual mode
xnoremap <tab> >gv
xnoremap <s-tab> <gv
xnoremap > >gv
xnoremap < <gv

" Backspace
xnoremap <BS> d
if g:os == "osx"
    inoremap <A-BS> <C-w>
elseif g:os == "win"
    inoremap <C-BS> <C-w>
endif

" Format
noremap <Leader>gq gqap

" Buffer contorls
nnoremap <silent> <leader>n :bnext<CR>
nnoremap <silent> <leader>N :bprev<CR>

" Diff commands
nnoremap <silent> <leader>dt :diffthis<CR>
nnoremap <silent> <leader>do :diffoff!<CR>

" Window control
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Resize windows
if has("gui_running")
    nnoremap <S-Up> 10<C-W>+
    nnoremap <S-Down> 10<C-W>-
    nnoremap <S-Left> 10<C-W><
    nnoremap <S-Right> 10<C-W>>
else
    nnoremap <Up> 10<C-W>+
    nnoremap <Down> 10<C-W>-
    nnoremap <Left> 10<C-W><
    nnoremap <Right> 10<C-W>>
endif

" Splitting
nnoremap <leader>sp :split<CR>
nnoremap <leader>vs :vsplit<CR>

" Make x not yank to register
noremap x "_x

" Global copy and paste
xnoremap <leader>y "*y
xnoremap <leader>d "*d
xnoremap <leader>p "*p
nnoremap <leader>p "*p
xnoremap <leader>P "*P
nnoremap <leader>P "*P

" CTRL-A is Select all, etc
if g:os != "osx"
    noremap <C-A> ggVG
    inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
    cnoremap <C-A> <C-C>gggH<C-O>G
    onoremap <C-A> <C-C>gggH<C-O>G
    snoremap <C-A> <C-C>gggH<C-O>G
    xnoremap <C-A> <C-C>ggVG
endif

" Don't bring up help on F1
noremap <F1> <ESC>
inoremap <F1> <ESC>

" Disable middle mouse button pasting
noremap <MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
noremap <2-MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
noremap <3-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
noremap <4-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>

" Get rid of Ex mode
nnoremap <S-Q> <Q>


" Commands: {{{1 =============================================================

" Set window title
command! -nargs=1 Title :set title titlestring=<args>

" Strip extra whitespace
command! Strip %s/\s\+$//

" Change directory to current buffer
command! CD :lcd %:p:h

" Save command typos
command! Q q
command! QA qa
command! Qa qa
command! W w
command! Wq wq
command! WQ wq


" Plugins: {{{1 ==============================================================

filetype off
" set the runtime path to include Vundle and initialize
let s:vundle_path = expand("~/.vim/bundle/")
if has("win32") || has("win64")
    let s:vundle_path = expand("~/vimfiles/bundle/")
endif
execute "set runtimepath+=" . s:vundle_path . "/vundle/"
call vundle#rc(s:vundle_path)

Plugin 'gmarik/vundle'

Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'hdima/python-syntax'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jonathanfilip/vim-dbext'
Plugin 'jonathanfilip/vim-lucius'
"Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'othree/xml.vim'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
" Plugin 'tpope/vim-markdown'
"Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'will133/vim-dirdiff'
" Plugin 'vim-scripts/vcscommand.vim'
Plugin 'jonathanfilip/vim-vcscommand'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

filetype plugin indent on


" Airline: {{{2 --------------------------------------------------------------

let g:airline_left_sep=''
let g:airline_right_sep=''


" Ctags: {{{2 ----------------------------------------------------------------

let g:ctags_bin = "ctags"


" CtrlP: {{{2 ----------------------------------------------------------------

let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 0
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 0
let g:ctrlp_buftag_ctags_bin = g:ctags_bin
let g:ctrlp_switch_buffer = 'vh'
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_custom_ignore = {
            \ 'dir': 'tests$',
            \ 'file': '',
            \ }

nnoremap <silent> <leader>ff :CtrlP<CR>
nnoremap <silent> <leader>fb :CtrlPBuffer<CR>
nnoremap <silent> <leader>fr :CtrlPMRU<CR>
nnoremap <silent> <leader>ft :CtrlPBufTag<CR>

nnoremap <silent> <leader>e :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
"nnoremap <silent> <leader>o :CtrlP<CR>
"nnoremap <silent> <leader>r :CtrlPMRU<CR>
"nnoremap <silent> <leader>t :CtrlPBufTag<CR>


" Dbext: {{{2 ----------------------------------------------------------------

let g:dbext_default_prompt_for_parameters = 0
let g:dbext_default_display_cmd_line = 1
let g:dbext_default_SQLITE_bin = "sqlite3"
let g:dbext_default_history_file = "$HOME/.dbext_sql_history.txt"


" Myfuncs: {{{2 --------------------------------------------------------------

let g:projects = {}
let g:databases = {}


" NERD Commenter: {{{2 -------------------------------------------------------

let g:NERDShutUp = 1
let g:NERDRemoveExtraSpaces=0


" NERD Tree: {{{2 ------------------------------------------------------------

let g:NERDTreeChDirMode = 0
let g:NERDChristmasTree = 1
let g:NERDTreeCaseSensitiveSort = 0
let g:NERDTreeIgnore = ['\.doc$', '\.pdf$', '\.xls$', '\.docx$',
            \'\.zip$', '\.dll$', '\.so$', '\.pyc$', '\~$']
let g:NERDTreeShowHidden = 0
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 32

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <C-F3> :NERDTree<CR>
nnoremap <S-F3> :NERDTreeClose<CR>


" Python: {{{2 ---------------------------------------------------------------

let g:python_highlight_all = 1
let g:pyindent_open_paren = "&sw"
let g:pyindent_nested_paren = "&sw"
let g:pyindent_continue = "&sw"

augroup python
    autocmd!
    autocmd BufEnter *.py :syntax sync fromstart " helps with ''' comments
augroup end


" SQLUtilities: {{{2 ---------------------------------------------------------

let g:sql_type_default = "sqlanywhere"
let g:sqlutil_align_where = 0
let g:sqlutil_align_comma = 1
let g:sqlutil_align_first_word = 1
let g:sqlutil_keyword_case = '\L'


" SuperTab: {{{2 -------------------------------------------------------------

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabContextTextOmniPrecedence = ["&completefunc"]

augroup super_tab
    autocmd!
    autocmd BufEnter *.md,*.txt,*.wiki :let b:SuperTabNoCompleteAfter = 
                \ g:SuperTabNoCompleteAfter + ['\.', '\*', '-', ')']
augroup end


" Syntastic: {{{2 ------------------------------------------------------------

let g:syntastic_check_on_open = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = {
            \ "mode": "passive",
            \ "active_filetypes": [],
            \ "passive_filetypes": [] }
let g:syntastic_python_checkers = ["pyflakes"]

nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>sr :SyntasticReset<CR>


" Tagbar: {{{2 ---------------------------------------------------------------

let g:tagbar_compact = 0
let g:tagbar_left = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_ctags_bin = g:ctags_bin
let g:tagbar_type_python = {
    \ 'kinds' : [
        \ 'c:classes',
        \ 'f:functions',
        \ 'm:class members',
        \ 'v:variables:1',
        \ 'i:imports:1'
    \ ]
\ }

nnoremap <F4> :TagbarToggle<CR>
noremap <leader>tt :echo tagbar#currenttag('%s','','fs')<CR>
nnoremap <Leader>tb :TagbarToggle<CR>


" VCS: {{{2 ------------------------------------------------------------------

let g:VCSCommandDeleteOnHide = 1

nnoremap <Leader>vd :VCSVimDiff<CR>

augroup VCSCommand
    autocmd!
    autocmd User VCSBufferCreated set bufhidden=wipe
augroup end



" Colorscheme: {{{1 ==========================================================

colorscheme lucius
if has("gui_running")
    LuciusLight
else
    LuciusLight
    "LuciusDark
endif


" Autocommands: {{{1 =========================================================

" Only show cursor line in current buffer in normal mode
augroup cursor_line
    autocmd!
    autocmd WinLeave,InsertEnter * set nocursorline
    autocmd WinEnter,InsertLeave * set cursorline
augroup end

" Close the preview window automatically
augroup preview_window
    autocmd!
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup end

" Set xaml to be like xml
augroup xaml
    autocmd!
    autocmd BufNewFile,BufRead *.xaml setfiletype xml
augroup end


" Miscellaneous: {{{1 ========================================================

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif


" Local Settings: {{{1 =======================================================

if filereadable(expand("~/.vimrc_local"))
    source ~/.vimrc_local
endif

" vim: foldenable foldmethod=marker

