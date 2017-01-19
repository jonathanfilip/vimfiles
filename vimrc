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
set formatoptions=tcrqnl
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j
endif
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
    if has("termguicolors")
        if &term == "screen-256color"
            set term=xterm-256color
        endif
        set termguicolors
    else
        set t_Co=256
        set term=xterm-256color
    endif
    set ttymouse=xterm2
endif

" Use system clipboard
if has("clipboard")
    if has("unnamedplus")
        set clipboard=unnamedplus,unnamed
    else
        set clipboard=unnamed
    endif
else
    set clipboard=
endif

" Grep
if has('unix')
    if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
    elseif executable('ack')
        set grepprg=ack\ -s\ --with-filename\ --nocolor\ --nogroup\ --column
    endif
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

if g:os != "win"
    set shellslash
endif

syntax on

set path=.,**
set tags=./tags;/.

if version >= 704 && has("patch-7.4-399")
    set cryptmethod=blowfish2
elseif version >= 703
    set cryptmethod=blowfish
endif


" UI Settings: {{{2 ----------------------------------------------------------

set cmdheight=1
set colorcolumn=+1
set cursorline
set display+=lastline
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
        set antialias
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
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set shiftround


" Completion Settings: {{{2 --------------------------------------------------

set complete=.,w,b,u
set completeopt=longest,menu
set wildignorecase
set wildmenu
set wildmode=longest:full,full
" set wildmode=list:longest,full
set pumheight=16

set wildignore+=*.pyc,*.pyd,*.pyo " python files
set wildignore+=*.bmp,*.gif,*.ico,*.png,*.jpg,*.jpeg " images
set wildignore+=*.csproj,*.pdb,*.resx,*.sln,*.suo " visual studio
set wildignore+=*.doc,*.docx,*.pdf,*.xls,*.xlsx " documents
set wildignore+=*.dll,*.exe,*.lib,*.map,*.o,*.obj,*.so " binaries
set wildignore+=*.h5,*.gz " compressed files
set wildignore+=*.bak,*~,tmp " misc files
set wildignore+=.svn\*,.git\* " scm
set wildignore+=cscope.out,tags " vim


" File Settings: {{{2 --------------------------------------------------------

filetype plugin indent on
set autoread
set fileformats=unix,dos
set nobackup
set nowritebackup
set noswapfile


" Mappings: {{{1 =============================================================

let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"

" Indenting in visual mode
xnoremap <silent> <tab> >gv
xnoremap <silent> <s-tab> <gv
xnoremap <silent> > >gv
xnoremap <silent> < <gv

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
nnoremap <silent> <leader>p :bprev<CR>

" Diff commands
nnoremap <silent> <leader>dt :diffthis<CR>
nnoremap <silent> <leader>do :diffoff!<CR>

" Window control
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Resize windows
nnoremap <Up> 10<C-W>+
nnoremap <Down> 10<C-W>-
nnoremap <Left> 10<C-W><
nnoremap <Right> 10<C-W>>

" Transpose and indent lines
nnoremap <silent> <S-Up> :move-2<CR>==
nnoremap <silent> <S-Down> :move+<CR>==
inoremap <silent> <S-Up> <Esc>:move-2<CR>==gi
inoremap <silent> <S-Down> <Esc>:move+<CR>==gi
vnoremap <silent> <S-Up> :move'<-2<CR>gv=gv
vnoremap <silent> <S-Down> :move'>+<CR>gv=gv

" Splitting
nnoremap <leader>sp :split<CR>
nnoremap <leader>vs :vsplit<CR>

" Make x not yank to register
noremap x "_x

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

" Wrap a word in quotes
nnoremap <silent> <leader>q' ciw'<C-R><C-O>"'<Esc>
nnoremap <silent> <leader>q" ciw"<C-R><C-O>""<Esc>
nnoremap <silent> <leader>q" ciw"<C-R><C-O>""<Esc>
nnoremap <silent> <leader>q( ciw(<C-R><C-O>")<Esc>
nnoremap <silent> <leader>q[ ciw[<C-R><C-O>"]<Esc>
nnoremap <silent> <leader>q{ ciw{<C-R><C-O>"}<Esc>
nnoremap <silent> <leader>q< ciw<<C-R><C-O>"><Esc>

" Preview tag on Enter
nnoremap <silent> <leader><CR> :ptjump <C-R>=expand("<cword>")<CR><CR>

" Highlight text from last Insert mode
nnoremap <silent> gV `[v`]


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

" Jump to the next diff and obtain it (repeat with @@, followed by @:)
command! -nargs=0 Fix :normal! ]cdo<CR>

" Find TODO, XXX, etc.
command! -nargs=0 Todo :lvimgrep /\#\s*\(XXX\|TODO\|NOTE\)/ %<CR>


" Plugins: {{{1 ==============================================================

if has("win32") || has("win64")
    call plug#begin('~/vimfiles/bundle')
else
    call plug#begin('~/.vim/bundle')
endif

Plug 'chaoren/vim-wordmotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'jonathanfilip/dbext.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'othree/xml.vim'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'vimwiki/vimwiki'
Plug 'wellle/targets.vim'
Plug 'will133/vim-dirdiff'

if v:version > 704 || v:version == 704 && has("patch1826")
    Plug 'airblade/vim-gitgutter'
endif


call plug#end()


" Airline: {{{2 --------------------------------------------------------------

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_inactive_collapse = 1
let g:airline_powerline_fonts = 0

let g:airline_extensions = ['syntastic', 'ctrlp']
let g:airline#extensions#default#layout = [
    \ [ 'a', 'c' ],
    \ [ 'x', 'y', 'z', 'error', 'warning' ]
    \ ]


" Ctags: {{{2 ----------------------------------------------------------------

let g:ctags_bin = "ctags"


" CtrlP: {{{2 ----------------------------------------------------------------

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
            \ 'dir': 'tests$',
            \ 'file': '',
            \ }
let g:ctrlp_lazy_update = 0
let g:ctrlp_match_window='position:bottom,order:btt,min:1,max:10,results:100'
let g:ctrlp_show_hidden = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

if has('unix')
    if executable('ag')
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        if len(&wildignore > 0)
            let g:ctrlp_user_command = g:ctrlp_user_command . ' --ignore=' . &wildignore
        endif

        let g:ctrlp_use_caching = 0
    endif
endif


nnoremap <silent> <leader>ff :CtrlP<CR>
nnoremap <silent> <leader>fb :CtrlPBuffer<CR>
nnoremap <silent> <leader>fr :CtrlPMRU<CR>
nnoremap <silent> <leader>ft :CtrlPBufTag<CR>

nnoremap <silent> <leader>e :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>


" Dbext: {{{2 ----------------------------------------------------------------

let g:dbext_default_prompt_for_parameters = 0
let g:dbext_default_display_cmd_line = 1
let g:dbext_default_SQLITE_bin = "sqlite3"
let g:dbext_default_history_file = "$HOME/.dbext_sql_history.txt"


" Myfuncs: {{{2 --------------------------------------------------------------

let g:projects = {}
let g:databases = {}


" Pandoc: {{{2 ---------------------------------------------------------------

let g:pandoc#modules#enabled = [
            \"command",
            \"formatting",
            \"metadata",
            \"keyboard" ,
            \"toc",
            \"completion",
            \]

let g:pandoc#formatting#mode = "h"
let g:pandoc#formatting#textwidth = "79"

let g:pandoc#keyboard#enabled_submodules = [
            \"lists",
            \"references",
            \"styles",
            \"sections",
            \"links"]

let g:pandoc#spell#enabled = 0

let g:pandoc#syntax#codeblocks#embeds#langs = [
            \"python",
            \"cpp",
            \"c",
            \"cs",
            \"sql",
            \"xml",
            \]


" Python: {{{2 ---------------------------------------------------------------

let g:python_highlight_all = 1
let g:pyindent_open_paren = "&sw"
let g:pyindent_nested_paren = "&sw"
let g:pyindent_continue = "&sw"

augroup python
    autocmd!
    autocmd BufEnter *.py :syntax sync fromstart " helps with ''' comments
augroup end


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
let g:syntastic_enable_balloons = has("gui")
let g:syntastic_always_populate_loc_list=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = {
            \ "mode": "passive",
            \ "active_filetypes": [],
            \ "passive_filetypes": [] }
let g:syntastic_python_checkers = ["pyflakes", "pep8"]

nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>sr :SyntasticReset<CR>


" WordMotion: {{{2 ------------------------------------------------------------------

let g:wordmotion_prefix='<leader>'

" VimWiki: {{{2 ------------------------------------------------------------------

" let g:vimwiki_list = [{
"     \ "path": "~/wiki/",
"     \ "path_html": "~/wiki/html/",
"     \ "ext": ".md",
"     \ "syntax": "markdown",
"     \ }]


" Colorscheme: {{{1 ==========================================================

colorscheme lucius
LuciusLight


" Autocommands: {{{1 =========================================================

" Only show cursor line in current buffer in normal mode
augroup cursor_line
    autocmd!
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline
    autocmd WinEnter * set cursorline colorcolumn=+1
    autocmd WinLeave * set nocursorline colorcolumn=
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
    autocmd BufNewFile *.xaml setfiletype xml
    autocmd BufRead *.xaml setfiletype xml
augroup end


" Miscellaneous: {{{1 ========================================================

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif


" Local Settings: {{{1 =======================================================

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" vim: nofoldenable foldmethod=marker

