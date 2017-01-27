hi clear
if exists("syntax_on")
    syntax reset
endif

set background=dark

hi  Normal          guifg=#c0d0e0   guibg=#203040   gui=NONE

hi  Cursor          guifg=bg        guibg=#d0e0f0   gui=NONE
hi  CursorLine      guifg=NONE      guibg=#304050   gui=NONE
hi  CursorColumn    guifg=NONE      guibg=#304050   gui=NONE
hi  ColorColumn     guifg=NONE      guibg=#283848   gui=NONE

hi  LineNr          guifg=#506070   guibg=#304050
hi  CursorLineNr    guifg=#90a0b0   guibg=#304050


hi  Comment         guifg=#708090   guibg=NONE      gui=NONE
hi  Conceal         guifg=#708090   guibg=NONE      gui=NONE

hi  Constant        guifg=#d0d0a0   guibg=NONE      gui=NONE
hi  Constant        guifg=#d0d0b0   guibg=NONE      gui=NONE

hi  Statement       guifg=#80d0e0   guibg=NONE      gui=NONE
hi  Type            guifg=#80e0d0   guibg=NONE      gui=NONE

hi  Identifier      guifg=#a0d0a0   guibg=NONE      gui=NONE

hi  PreProc         guifg=#80d0b0   guibg=NONE      gui=NONE

hi  Special         guifg=#e0c0d0   guibg=NONE      gui=NONE


hi  Directory       guifg=#a0d0a0   guibg=NONE      gui=NONE
hi  Title           guifg=#50a0d0   guibg=NONE      gui=NONE

hi  NonText         guifg=#506080   guibg=NONE      gui=NONE
hi  SpecialKey      guifg=#508060   guibg=NONE      gui=NONE

hi  Error           guifg=#f09090   guibg=#703030   gui=NONE
hi  Search          guifg=bg        guibg=#d78700   gui=NONE
hi  IncSearch       guifg=bg        guibg=#50d0d0   gui=NONE
hi  Todo            guifg=#c0c070   guibg=#505030   gui=NONE

hi  ErrorMsg        guifg=#e05050   guibg=NONE      gui=NONE
hi  ModeMsg         guifg=#a0d0c0   guibg=NONE      gui=NONE
hi  MoreMsg         guifg=#a0d0c0   guibg=NONE      gui=NONE
hi  WarningMsg      guifg=#c08050   guibg=NONE      gui=NONE


hi  StatusLine      guifg=bg        guibg=#8090a0   gui=NONE
hi  StatusLineNC    guifg=#506070   guibg=#8090a0   gui=NONE
hi  VertSplit       guifg=#607080   guibg=#8090a0   gui=NONE

hi  Visual          guifg=NONE      guibg=#205070   gui=NONE

hi  FoldColumn      guifg=#a0b0c0   guibg=#405060
hi  Folded          guifg=#a0b0c0   guibg=#405060
hi  Pmenu           guifg=bg        guibg=#a0b0c0
hi  PmenuSbar       guifg=#a0b0c0   guibg=#c0d0e0
hi  PmenuSel        guifg=fg        guibg=#205070
hi  PmenuThumb      guifg=fg        guibg=#708090

hi  SignColumn      guifg=#a0b0c0   guibg=#305060
hi  TabLine         guifg=bg        guibg=#a0b0c0
hi  TabLineFill     guifg=#405060   guibg=#a0b0c0   gui=NONE
hi  TabLineSel                      guibg=#205070

hi  Underlined      guifg=fg        gui=underline

hi DiffAdd          guifg=fg        guibg=#508050
hi DiffChange       guifg=fg        guibg=#808050
hi DiffDelete       guifg=fg        guibg=#805050
hi DiffText         guifg=#f0f080   guibg=#808050   gui=NONE

hi Ignore           guifg=bg

hi MatchParen       guifg=fg        guibg=#80a050
hi Question         guifg=fg
hi SpellBad                                         gui=undercurl guisp=#f05050
hi SpellCap                                         gui=undercurl guisp=#50a0d0
hi SpellLocal                                       gui=undercurl guisp=#d0a050
hi SpellRare                                        gui=undercurl guisp=#50a050

