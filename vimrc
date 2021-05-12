" Vim configuration file
" Author: Jonathan Filip


" Setup: {{{1 ================================================================

set encoding=utf-8

" Set location so we can set variables accordingly
let g:os = ""
if has("win32") || has("win64")
    let g:os="win"
elseif has("win32unix")
    let g:os = "cygwin"
elseif has("unix")
    let g:os = "linux"
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
set formatoptions=tcrqnlj
set nojoinspaces
set nowrap
set nrformats-=octal
set scrollopt=jump,ver,hor
set sidescroll=10
set splitbelow
set splitright
set virtualedit=block
set whichwrap+=<,>,h,l

set linebreak
if exists("+breakindent")
    set breakindent
    set showbreak=\ \ \\_
endif

" GUI/terminal and colors
" let g:airline_theme = "lucius"
if !has("gui_running")
    if &term == "screen-256color"
        set term=xterm-256color
    endif
    if has("termguicolors") && $COLORTERM ==? "truecolor"
        set termguicolors
    endif
    set ttymouse=sgr
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
if g:os == "linux"
    if executable('rg')
        set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    elseif executable('ag')
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

if version >= 801 && has("patch-8.1-360")
    set diffopt+=indent-heuristic
    set diffopt+=algorithm:patience
endif


" UI Settings: {{{2 ----------------------------------------------------------

set cmdheight=1
set colorcolumn=+1
set cursorline
set display+=lastline
" set fillchars=
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
    if g:os == "win"
        set guifont=Cascadia_Mono_PL:h9
    elseif has("gui_macvim")
        set guifont=Cascadia_Mono_PL:h10
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

" Refresh
nnoremap <silent> <F5> :e<CR>

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

" Preview tag on Enter
nnoremap <silent> <leader><CR> :ptjump <C-R>=expand("<cword>")<CR><CR>

" Highlight text from last Insert mode
nnoremap <silent> gV `[v`]


" Functions: {{{1 ============================================================

function! s:TabComplete(mode)
    let cmd = a:mode == "P" ? "\<C-P>" : "\<C-N>"
    if pumvisible()
        return cmd
    endif

    let pos = getpos('.')

    " Only match letters, numbers, slashes, and dots.
    let pattern = "[A-Za-z0-9/.]*$"
    let substr = matchstr(strpart(getline(pos[1]), 0, pos[2] - 1), pattern)
    if empty(substr)
        return (a:mode == "P") ? "\<C-d>" : "\<Tab>"
    endif

    let file_path = '\/'
    let file_pattern = match(substr, file_path) != -1
    if file_pattern
        return "\<C-x>\<C-f>"
    endif

    return cmd
endfunction

" Only needed to prevent setting in vsvim
if v:version > 700
    inoremap <silent> <Tab> <C-R>=<SID>TabComplete("N")<CR>
    inoremap <silent> <S-Tab> <C-R>=<SID>TabComplete("P")<CR>
endif


" Commands: {{{1 =============================================================

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

" Insert date
command! Date put! =strftime('%Y-%m-%d')


" Plugins: {{{1 ==============================================================

if g:os == "win"
    call plug#begin('~/vimfiles/bundle')
else
    call plug#begin('~/.vim/bundle')
endif

" Plug 'https://github.com/arcticicestudio/nord-vim'
Plug 'https://github.com/gruvbox-community/gruvbox'
Plug 'https://github.com/chaoren/vim-wordmotion'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/othree/xml.vim'
Plug 'https://github.com/tomtom/tcomment_vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/will133/vim-dirdiff'

if g:os != "win"
    Plug 'https://github.com/sheerun/vim-polyglot'
    Plug 'https://github.com/w0rp/ale'
    Plug 'https://github.com/preservim/tagbar'
    Plug 'https://github.com/vim-pandoc/vim-pandoc'
    Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax'
endif

if v:version > 704 || v:version == 704 && has("patch1826")
    Plug 'airblade/vim-gitgutter'
endif


call plug#end()


" Airline: {{{2 --------------------------------------------------------------

" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_inactive_collapse = 1
let g:airline_powerline_fonts = 1
" let g:airline_symbols_ascii = 1

" let g:airline_extensions = ['ctrlp']
" let g:airline#extensions#default#layout = [
"             \ [ 'a', 'c' ],
"             \ [ 'x', 'y', 'z', 'error', 'warning' ]
"             \ ]

let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

if g:os != "linux"
    let g:airline_extensions = []
endif


" ALE: {{{2 ------------------------------------------------------------------

let g:ale_linters = {
            \ "python": ["flake8"],
            \ }
let g:ale_lint_on_enter = 1
let g:ale_set_signs = 0
let g:ale_python_flake8_options = "--ignore=E501"
let g:ale_set_balloons = 0
let g:ale_fixers = {
            \ "python": ["black", "isort"]
            \}
let g:ale_python_black_options = "-l 100"
let g:ale_python_isort_options = "-l 100"


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

if g:os == "linux"
    if executable('rg')
        let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
        let g:ctrlp_use_caching = 0
    elseif executable('ag')
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        if len(&wildignore > 0)
            let g:ctrlp_user_command = g:ctrlp_user_command . ' --ignore=' . &wildignore
        endif

        let g:ctrlp_use_caching = 0
    endif
elseif g:os == "win"
    let g:ctrlp_use_caching = 1
    let g:ctrlp_clear_cache_on_exit = 0

endif


nnoremap <silent> <leader>ff :CtrlP<CR>
nnoremap <silent> <leader>fb :CtrlPBuffer<CR>
nnoremap <silent> <leader>fr :CtrlPMRU<CR>
nnoremap <silent> <leader>ft :CtrlPBufTag<CR>


" Dbext: {{{2 ----------------------------------------------------------------

let g:dbext_default_prompt_for_parameters = 0
let g:dbext_default_display_cmd_line = 1
let g:dbext_default_SQLITE_bin = "sqlite3"
let g:dbext_default_history_file = "$HOME/.dbext_sql_history.txt"


" Git Gutter: {{{2 -----------------------------------------------------------

let g:gitgutter_override_sign_column_highlight = 0


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

" let g:pandoc#formatting#mode = "ha"
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

let g:pandoc#formatting#extra_equalprg = ""


" Python: {{{2 ---------------------------------------------------------------

let g:python_highlight_all = 1
let g:pyindent_open_paren = "&sw"
let g:pyindent_nested_paren = "&sw"
let g:pyindent_continue = "&sw"

augroup python
    autocmd!
    autocmd BufEnter *.py :syntax sync fromstart " helps with ''' comments
augroup end


" WordMotion: {{{2 -----------------------------------------------------------

let g:wordmotion_prefix='<leader>'


" Polyglot: {{{2 -----------------------------------------------------------

let g:python_pep8_indent_hang_closing = 0


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

augroup cpp
    autocmd!
    autocmd BufNewFile *.C setfiletype cpp
    autocmd BufRead *.C setfiletype cpp
    autocmd BufNewFile *.H setfiletype cpp
    autocmd BufRead *.H setfiletype cpp
augroup end


" Miscellaneous: {{{1 ========================================================

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif


" Colorscheme: {{{1 ==========================================================

" colorscheme lucius
" colorscheme lucius

if $TERM_PROGRAM ==? "Apple_Terminal"
    let s:mode = system("defaults read -g AppleInterfaceStyle")
    if s:mode =~ '^Dark'
        set background=dark
    else
        set background=light
    endif
    colorscheme gruvbox
else
    colorscheme gruvbox
endif




"     let s:mode = systemlist("defaults read -g AppleInterfaceStyle")[0]
"     if s:mode ==? "dark"
"         set background=dark
"         colorscheme iceberg
"     else
"         set background=light
"         colorscheme iceberg
"     endif
" else
"     LuciusWhite
" endif



" Local Settings: {{{1 =======================================================

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" vim: nofoldenable foldmethod=marker
