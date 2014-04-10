﻿" Vim configuration file
" Author: Jonathan Filip


" ============================================================================
" Setup:
" ============================================================================

set nocompatible

" Set location so we can set variables accordingly
let location = "home_osx"
if exists("$CITADEL_ENV")
    if has("win32") || has("win64")
        let location="work_win"
    else
        let location="work_linux"
    endif
elseif has("win32") || has("win64")
    let location="home_win"
endif

function! InLocation(...)
    for l in a:000
        if g:location == l
            return 1
        endif
    endfor
    return 0
endfunction


" ============================================================================
" General Options:
" ============================================================================

set shortmess=flmnrxIstToO
set showmode
set history=1000
set nofoldenable foldmethod=manual
set browsedir=buffer
set shellslash
set hidden
set tags=./tags;/.
if !has("gui_running")
    set t_Co=256
    set term=xterm-256color
endif
if has("clipboard")
    set clipboard=unnamed
endif

syntax on

set wildignore+=
            \*.bak
            \*.csproj
            \*.dll
            \*.doc
            \*.exe
            \*.gif
            \*.gz
            \*.h5
            \*.ico
            \*.jpg
            \*.lib
            \*.map
            \*.o
            \*.obj
            \*.pcl
            \*.pdb
            \*.pdf
            \*.png
            \*.pyc
            \*.pyd
            \*.pyo
            \*.resx
            \*.sln
            \*.so
            \*.suo
            \*.ttf
            \*.xls
            \*~
            \.svn\*
            \cscope.out
            \tags
            \tmp


" ============================================================================
" UI Options:
" ============================================================================

set cmdheight=1
set completeopt=longest,menu complete=.,w,b,u
set confirm
set guioptions=egc
set laststatus=2
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set fillchars=
set mouse=a mousehide ttymouse=xterm2
set noequalalways
set noerrorbells novisualbell
set ruler showcmd
set scrollopt=jump,ver,hor
set showtabline=1
set sidescroll=10
set splitbelow splitright
set statusline=%<%f\ %h%m%r%y[%{&ff}]%=%-14.(%l,%c%V%)\ %P
set wildmenu wildmode=list:longest,full
set winminheight=0 winminwidth=0
set ignorecase incsearch nohlsearch smartcase
if has("gui_running")
    set title
    if InLocation("home_osx")
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


" ============================================================================
" File Options:
" ============================================================================

filetype plugin indent on
set autoread
set encoding=utf-8
set fileformats=unix,dos
set nobackup nowritebackup noswapfile


" ============================================================================
" Editting Options:
" ============================================================================

set autoindent
set backspace=indent,eol,start
set formatoptions=tcrqn
set nrformats-=octal
set nowrap nojoinspaces
set showmatch
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab shiftround
set virtualedit=block
set whichwrap+=<,>,h,l
if version >= 703
    set cryptmethod=blowfish
endif


" ============================================================================
" Key Mappings:
" ============================================================================

let mapleader = ";"
let maplocalleader = ";"

" Indenting in visual mode
vnoremap <tab> >gv
vnoremap <s-tab> <gv
vnoremap > >gv
vnoremap < <gv

vnoremap <BS> d
if InLocation("home_osx")
    inoremap <A-BS> <C-w>
elseif InLocation("home_win") || InLocation("work_win")
    inoremap <C-BS> <C-w>
endif

map <Leader>gq gqap

" Buffer contorls
noremap <silent> <leader>n :bnext<CR>
noremap <silent> <leader>p :bprev<CR>

" Diff commands
noremap <silent> <leader>dt :diffthis<CR>
noremap <silent> <leader>do :diffoff!<CR>

" Window control
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

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
noremap <leader>sp :split<CR>
noremap <leader>vs :vsplit<CR>

" Make x not yank to register
noremap x "_x

" CTRL-A is Select all, etc
if !InLocation("home_osx")
    noremap <C-A> ggVG
    inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
    cnoremap <C-A> <C-C>gggH<C-O>G
    onoremap <C-A> <C-C>gggH<C-O>G
    snoremap <C-A> <C-C>gggH<C-O>G
    xnoremap <C-A> <C-C>ggVG
endif

" Don't bring up help on F1
map <F1> <ESC>
imap <F1> <ESC>

" Disable middle mouse button pasting
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

" Get rid of Ex mode
nnoremap <S-Q> <Q>


" ============================================================================
" Commands:
" ============================================================================

command! -nargs=1 Title :set title titlestring=<args>

" Strip extra whitespace
command! Strip %s/\s\+$//

" Change directory to current buffer
command! CD :lcd %:p:h

" More lenient to save command
command! Q q
command! QA qa
command! Qa qa
command! W w
command! Wq wq
command! WQ wq


" ============================================================================
" Plugin Options:
" ============================================================================

" set the runtime path to include Vundle and initialize
let s:vundle_path = expand("~/.vim/bundle/")
if has("win32") || has("win64")
    let s:vundle_path = expand("~/vimfiles/bundle/")
endif
execute "set runtimepath+=" . s:vundle_path . "/vundle/"
call vundle#rc(s:vundle_path)

" ----------------------------------------------------------------------------
" Vundle:
" ----------------------------------------------------------------------------

Plugin 'gmarik/vundle'

Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'hdima/python-syntax'
Plugin 'jonathanfilip/vim-dbext'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'othree/xml.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-markdown'
Plugin 'vim-scripts/DirDiff.vim'
Plugin 'vim-scripts/vcscommand.vim'


" ----------------------------------------------------------------------------
" Airline:
" ----------------------------------------------------------------------------

let g:airline_left_sep=''
let g:airline_right_sep=''

" ----------------------------------------------------------------------------
" Ctags:
" ----------------------------------------------------------------------------

let g:ctags_bin = "ctags"


" ----------------------------------------------------------------------------
" CtrlP:
" ----------------------------------------------------------------------------

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

noremap <silent> <leader>ff :CtrlP<CR>
noremap <silent> <leader>fb :CtrlPBuffer<CR>
noremap <silent> <leader>fr :CtrlPMRU<CR>
noremap <silent> <leader>ft :CtrlPBufTag<CR>


" ----------------------------------------------------------------------------
" Dbext:
" ----------------------------------------------------------------------------

let g:dbext_default_prompt_for_parameters = 0
let g:dbext_default_display_cmd_line = 1
let g:dbext_default_SQLITE_bin = "sqlite3"
let g:dbext_default_history_file = "$HOME/.dbext_sql_history.txt"


" ----------------------------------------------------------------------------
" Lucius:
" ----------------------------------------------------------------------------

let g:projects = {}
let g:databases = {}
command! Tags call lucius#GenerateTags(fnamemodify(bufname('%'), \':p:h'), 0) " current file dir
command! TagsForce call lucius#GenerateTags(fnamemodify(bufname('%'), \':p:h'), 1) " current file dir, force
command! TagsCwd call lucius#GenerateTags(getcwd(), 0) " current cwd
command! TagsCwdForce call lucius#GenerateTags(getcwd(), 1) " cwd, force
command! -nargs=1 -complete=file Sqlite :call lucius#LoadSqlite(<q-args>)
command! -nargs=1 -complete=custom,lucius#DatabaseComplete Database :call
            \lucius#LoadDatabase(<q-args>)
command! -nargs=1 -complete=custom,lucius#DatabaseComplete Data :call
            \lucius#LoadDatabase(<q-args>)
command! -nargs=1 -complete=custom,lucius#ProjectComplete Project :call
            \lucius#LoadProject(<q-args>)
command! -nargs=1 -complete=custom,lucius#ProjectComplete Proj :call
            \lucius#LoadProject(<q-args>)

noremap <C-f> :call lucius#ToggleSearchHighlighting()<CR>
nnoremap <F10> :call lucius#ToggleTextWidth()<CR>
nnoremap <S-F10> :call lucius#ToggleWrap()<CR>
nnoremap <F11> :call lucius#ToggleSpellCheck()<CR>
nnoremap <F12> :call lucius#ToggleScrollbars()<CR>

if has("python")
    command! -range EvalPythonRange call lucius#EvaluateCurrentRange()
    map <silent> <F5> :EvalPythonRange<CR>
endif


" ----------------------------------------------------------------------------
" NERD Commenter:
" ----------------------------------------------------------------------------

let NERDShutUp = 1
let NERDRemoveExtraSpaces=0


" ----------------------------------------------------------------------------
" NERD Tree:
" ----------------------------------------------------------------------------

let g:NERDTreeChDirMode = 0
let g:NERDChristmasTree = 1
let g:NERDTreeCaseSensitiveSort = 0
let g:NERDTreeIgnore = ['\.doc$', '\.pdf$', '\.xls$', '\.docx$',
            \'\.zip$', '\.dll$', '\.so$', '\.pyc$', '\~$']
let g:NERDTreeShowHidden = 0
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 32

map <F3> :NERDTreeToggle<CR>
map <C-F3> :NERDTree<CR>
map <S-F3> :NERDTreeClose<CR>


" ----------------------------------------------------------------------------
" Python:
" ----------------------------------------------------------------------------

let python_highlight_all = 1
au BufEnter *.py :syntax sync fromstart " helps with ''' comments

let g:pyindent_open_paren = "&sw"
let g:pyindent_nested_paren = "&sw"
let g:pyindent_continue = "&sw"


" ----------------------------------------------------------------------------
" SQLUtilities:
" ----------------------------------------------------------------------------

let g:sql_type_default = "sqlanywhere"
let g:sqlutil_align_where = 0
let g:sqlutil_align_comma = 1
let g:sqlutil_align_first_word = 1
let g:sqlutil_keyword_case = '\L'


" ----------------------------------------------------------------------------
" SuperTab:
" ----------------------------------------------------------------------------

let SuperTabDefaultCompletionType = "context"
let SuperTabContextDefaultCompletionType = "<c-n>"
let SuperTabContextTextOmniPrecedence = ["&completefunc"]
au BufEnter *.md,*.txt,*.wiki :let b:SuperTabNoCompleteAfter = g:SuperTabNoCompleteAfter + ['\.', '\*', '-', ')']


" ----------------------------------------------------------------------------
" Syntastic:
" ----------------------------------------------------------------------------

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
map <Leader>sc :SyntasticCheck<CR>
map <Leader>sr :SyntasticReset<CR>


" ----------------------------------------------------------------------------
" Tagbar:
" ----------------------------------------------------------------------------

let g:tagbar_compact = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_ctags_bin = g:ctags_bin
map <F4> :TagbarToggle<CR>

map <leader>t :echo tagbar#currenttag('%s','','fs')<CR>
"set statusline=%<%f\ %h%m%r%y[%{&ff}]\ \ %{tagbar#currenttag('%s','','f')}%=%-14.(%l,%c%V%)\ %P


" ----------------------------------------------------------------------------
" VCS:
" ----------------------------------------------------------------------------

let VCSCommandDeleteOnHide = 1
augroup VCSCommand
    au User VCSBufferCreated set bufhidden=wipe
augroup END
map <Leader>vd :VCSVimDiff<CR>


" ============================================================================
" Colorscheme:
" ============================================================================

colorscheme lucius
if has("gui_running")
    LuciusLight
else
    LuciusLight
    "LuciusDark
endif


" ============================================================================
" Autocommands:
" ============================================================================

" Close the preview window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Set xaml to be like xml
au BufNewFile,BufRead *.xaml setfiletype xml

" Format for xml
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Markdown
au FileType markdown setlocal formatoptions-=l textwidth=79

" ICE
au FileType slice setlocal cindent


" ============================================================================
" Functions:
" ============================================================================

" ----------------------------------------------------------------------------
" EditColors:
" ----------------------------------------------------------------------------

function! EditColors()
    execute 'e ' . expand("~/vimfiles/colors/lucius.vim")
    execute 'so $VIMRUNTIME/syntax/hitest.vim'
    execute 'wincmd L'
    execute 'help syntax'
    execute 'wincmd ='
    execute '10wincmd +'
    execute '219'
    normal! zt
    execute 'wincmd h'
    execute 'set title titlestring=Colors'
endfunction
command! Colors call EditColors()


" ----------------------------------------------------------------------------
" GetOutput:
" ----------------------------------------------------------------------------

function! GetOutput(cmd)
    redir => message
    silent execute a:cmd
    redir END
    enew
    silent put=message
    set nomodified
endfunction
command! -nargs=+ -complete=command GetOutput call GetOutput(<q-args>)


" ----------------------------------------------------------------------------
" UseWorkSettings:
" ----------------------------------------------------------------------------

function! UseWorkSettings()
    "au BufNewFile,BufRead *.py set noexpandtab
    au BufNewFile,BufRead *.py set expandtab colorcolumn=80
    au BufNewFile,BufRead *.cpp set noexpandtab
    au BufNewFile,BufRead *.C set noexpandtab
    au BufNewFile,BufRead *.hpp set noexpandtab
    au BufNewFile,BufRead *.H set noexpandtab
    au BufNewFile,BufRead *.cs set noexpandtab
endfunction
command! WorkSettings :call UseWorkSettings()
if InLocation("work_win", "work_linux")
    WorkSettings
endif


" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif



" ============================================================================
" Local:
" ============================================================================

if filereadable(expand("~/.vimrc_local"))
    source ~/.vimrc_local
endif




