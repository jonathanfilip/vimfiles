hi clear
if exists("syntax_on")
    syntax reset
endif

set background=dark

" Cerulean #007ba7
" Cerulean (RGB) #003fff
" Cerulean Blue #2a52be
" Cobalt Blue #0047ab
" Dark Ocean Blue #03104f
" Midnight Blue #191970
" Midnight Blue (Crayola) #003366

" hi Normal guifg=#d8e8f8 guibg=#283848
" hi  Normal          guifg=#e0e0e0   guibg=#203040   gui=NONE
" hi  Normal          guifg=#e0e0e0   guibg=#203040   gui=NONE
" hi  Normal          guifg=#d0e0f0   guibg=#203040   gui=NONE
" hi  Normal          guifg=#d2e3f4   guibg=#223344   gui=NONE
" hi  Normal          guifg=#ccddee   guibg=#223344   gui=NONE
hi  Normal          guifg=#c0d0e0   guibg=#203040   gui=NONE

hi  Cursor          guifg=bg        guibg=#d8e8f8   gui=NONE
hi  CursorLine      guifg=NONE      guibg=#405060   gui=NONE
hi  CursorColumn    guifg=NONE      guibg=#405060   gui=NONE
hi  ColorColumn     guifg=NONE      guibg=#283848   gui=NONE

hi  LineNr          guifg=#526272   guibg=#344454
hi  CursorLineNr    guifg=#8e9eae   guibg=#344454


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
hi  Search          guifg=bg        guibg=#d78700   gui=NONE
hi  IncSearch       guifg=bg        guibg=#50d0d0   gui=NONE
hi  Todo            guifg=#d7d75f   guibg=#5f5f00   gui=NONE

hi  ErrorMsg        guifg=#ff5f5f   guibg=NONE      gui=NONE
hi  ModeMsg         guifg=#afd7d7   guibg=NONE      gui=NONE
hi  MoreMsg         guifg=#afd7d7   guibg=NONE      gui=NONE
hi  WarningMsg      guifg=#d7875f   guibg=NONE      gui=NONE


hi  StatusLine      guifg=bg        guibg=#90a0b0   gui=NONE
hi  VertSplit       guifg=bg        guibg=#90a0b0   gui=NONE
hi  StatusLineNC    guifg=#506070   guibg=#a0b0c0   gui=NONE
hi  VertSplit       guifg=#607090   guibg=#a0b0c0   gui=NONE

hi  Visual          guifg=NONE      guibg=#005070   gui=NONE

hi  FoldColumn      guifg=#acbccc   guibg=#3e4e5e
hi  Folded          guifg=#acbccc   guibg=#3e4e5e
hi  Pmenu                           guibg=#a0b0c0
hi  Pmenu           guifg=bg        guibg=#a2b2c2
hi  PmenuSbar       guifg=#a2b2c2   guibg=#c0d0e0
hi  PmenuSel        guifg=fg        guibg=#005f87
hi  PmenuThumb      guifg=fg        guibg=#708090

hi  SignColumn      guifg=#a2b2c2   guibg=#3e4e5e
hi  StatusLine                      guibg=#a0b0c0
hi  StatusLineNC                    guibg=#a0b0c0
hi  TabLine                         guibg=#a0b0c0
hi  TabLineFill                     guibg=#a0b0c0
hi  TabLineSel                      guibg=#005f87
hi  VertSplit                       guibg=#a0b0c0




hi Conceal       guifg=#708090
hi DiffAdd        guifg=fg guibg=#5f875f
hi DiffChange     guifg=fg guibg=#87875f
hi DiffDelete     guifg=fg guibg=#875f5f
hi DiffText        gui=bold guifg=#ffff87 guibg=#87875f
hi Directory     guifg=#afd7af
hi Error          guifg=#ff8787 guibg=#870000
hi ErrorMsg      guifg=#ff5f5f
hi Ignore        guifg=bg
" hi IncSearch      guifg=bg guibg=#5fd7d7
hi MatchParen     guifg=fg guibg=#87af00
hi ModeMsg       guifg=#afd7d7
hi MoreMsg       guifg=#afd7d7
hi Question      guifg=fg
" hi Search         guifg=bg guibg=#d78700
hi Special       guifg=#d7afd7
hi SpecialKey    guifg=#5f875f
hi SpellBad       gui=undercurl guisp=#ff5f5f
hi SpellCap       gui=undercurl guisp=#5fafd7
hi SpellLocal     gui=undercurl guisp=#d7af5f
hi SpellRare      gui=undercurl guisp=#5faf5f
hi Statement     guifg=#87d7ff
hi Title          gui=bold guifg=#5fafd7
hi Todo           guifg=#d7d75f guibg=#5f5f00
hi Underlined     gui=underline guifg=fg
hi WarningMsg    guifg=#d7875f
hi WildMenu       guifg=fg guibg=#005f87
