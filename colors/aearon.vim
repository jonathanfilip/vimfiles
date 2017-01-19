hi clear
if exists("syntax_on")
    syntax reset
endif

set background=dark

" hi Normal guifg=#d8e8f8 guibg=#283848
hi  Normal          guifg=#d0e0f0   guibg=#203040   gui=NONE
" hi Normal guifg=#e0e0e0 guibg=#203040

hi  Cursor          guifg=bg        guibg=#d8e8f8   gui=NONE
hi  CursorLine      guifg=NONE      guibg=#405060   gui=NONE
hi  ColorColumn     guifg=NONE      guibg=#283848   gui=NONE


hi  Comment         guifg=#708090   guibg=NONE      gui=NONE

hi  Constant        guifg=#d0d0a0   guibg=NONE      gui=NONE
hi  Constant        guifg=#d0d0b0   guibg=NONE      gui=NONE

hi  Statement       guifg=#80d0e0   guibg=NONE      gui=NONE
hi  Type            guifg=#80e0d0   guibg=NONE      gui=NONE

hi  Identifier      guifg=#a0d0a0   guibg=NONE      gui=NONE

hi  PreProc         guifg=#80d0b0   guibg=NONE      gui=NONE

hi  Special         guifg=#e0c0d0   guibg=NONE      gui=NONE


hi  Conceal         guifg=#808080   guibg=NONE      gui=NONE
hi  Directory       guifg=#afd7af   guibg=NONE      gui=NONE
hi  Title           guifg=#5fafd7   guibg=NONE      gui=NONE

hi  NonText         guifg=#506080   guibg=NONE      gui=NONE
hi  SpecialKey      guifg=#508060   guibg=NONE      gui=NONE
hi  Directory       guifg=#afd7af   guibg=NONE      gui=NONE

hi  Error           guifg=#ff8787   guibg=#870000   gui=NONE 
hi  IncSearch       guifg=bg        guibg=#5fd7d7   gui=NONE
hi  Search          guifg=bg        guibg=#d78700   gui=NONE
hi  Todo            guifg=#d7d75f   guibg=#5f5f00   gui=NONE

hi  ErrorMsg        guifg=#ff5f5f   guibg=NONE      gui=NONE
hi  ModeMsg         guifg=#afd7d7   guibg=NONE      gui=NONE
hi  MoreMsg         guifg=#afd7d7   guibg=NONE      gui=NONE
hi  WarningMsg      guifg=#d7875f   guibg=NONE      gui=NONE


hi  StatusLine      guifg=bg        guibg=#90a0b0   gui=NONE
hi  VertSplit       guifg=bg        guibg=#90a0b0   gui=NONE
hi  StatusLineNC    guifg=#506070   guibg=#a0b0c0   gui=NONE
hi  VertSplit       guifg=#607090   guibg=#a0b0c0   gui=NONE

hi Visual           guifg=NONE      guibg=#005070   gui=NONE

hi FoldColumn   guifg=#bcbcbc
hi Folded       guifg=#bcbcbc
hi Pmenu                        guibg=#b2b2b2
hi PmenuSbar    guifg=#b2b2b2   guibg=#d0d0d0
hi PmenuThumb                   guibg=#808080
hi SignColumn   guifg=#b2b2b2
hi StatusLine                   guibg=#b2b2b2
hi StatusLineNC                 guibg=#b2b2b2
hi TabLine                      guibg=#b2b2b2
hi TabLineFill                  guibg=#b2b2b2
hi TabLineSel                   guibg=#005f87
hi VertSplit                    guibg=#b2b2b2
