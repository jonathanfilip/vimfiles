hi clear
if exists("syntax_on")
    syntax reset
endif

set background=light

let g:colors_name = "aearonlight"

hi  Normal          guifg=#444444   guibg=#eeeeee   gui=NONE
hi  SpecialKey      guifg=#afd7af
hi  NonText         guifg=#afafd7
hi  Directory       guifg=#00875f
hi  ErrorMsg        guifg=#af0000
hi  IncSearch       guifg=fg        guibg=#5fd7d7
hi  Search          guifg=fg        guibg=#ffaf00
hi  MoreMsg         guifg=#005faf
hi  ModeMsg         guifg=#005faf
hi  LineNr          guifg=#9e9e9e   guibg=#dadada
hi  CursorLineNr    guifg=#626262   guibg=#dadada   gui=bold
hi  Question        guifg=fg
hi  StatusLine      guifg=bg        guibg=#6080a0   gui=NONE
hi  StatusLineNC    guifg=#dadada   guibg=#6080a0   gui=NONE
hi  VertSplit       guifg=#e4e4e4   guibg=#6080a0   gui=NONE
hi  Title           guifg=#005faf                   gui=bold
hi  Visual          guibg=#afd7ff
hi  VisualNOS       guifg=fg                        gui=underline
hi  WarningMsg      guifg=#af5f00
hi  WildMenu        guifg=fg        guibg=#afd7ff
hi  Folded          guifg=#626262   guibg=#bcbcbc   gui=bold
hi  FoldColumn      guifg=#626262   guibg=#bcbcbc   gui=bold
hi  DiffAdd         guifg=fg        guibg=#afd7af
hi  DiffChange      guifg=fg        guibg=#d7d7af
hi  DiffDelete      guifg=fg        guibg=#d7afaf
hi  DiffText        guifg=#d75f00   guibg=#d7d7af   gui=bold
hi  SignColumn      guifg=#626262   guibg=#d0d0d0
hi  Conceal         guifg=#808080
hi  SpellBad                                        gui=undercurl   guisp=#d70000
hi  SpellCap                                        gui=undercurl   guisp=#00afd7
hi  SpellRare                                       gui=undercurl   guisp=#5faf00
hi  SpellLocal                                      gui=undercurl   guisp=#d7af00
hi  Pmenu           guifg=bg        guibg=#808080
hi  PmenuSel        guifg=fg        guibg=#afd7ff
hi  PmenuSbar       guifg=#808080   guibg=#444444
hi  PmenuThumb      guifg=fg        guibg=#9e9e9e
hi  TabLine         guifg=bg        guibg=#808080
hi  TabLineSel      guifg=fg        guibg=#afd7ff   gui=bold
hi  TabLineFill     guifg=#dadada   guibg=#808080
hi  CursorColumn                    guibg=#dadada
hi  CursorLine                      guibg=#dadada
hi  ColorColumn                     guibg=#e4e4e4
hi  Cursor          guifg=bg        guibg=#5f87af
hi  MatchParen                      guibg=#5fd7d7
hi  Comment         guifg=#808080
hi  Constant        guifg=#af5f00
hi  Special         guifg=#870087
hi  Identifier      guifg=#008700
hi  Statement       guifg=#005faf
hi  PreProc         guifg=#008787
hi  Type            guifg=#005f87
hi  Underlined      guifg=fg                        gui=underline
hi  Ignore          guifg=bg
hi  Error           guifg=#af0000   guibg=#d7afaf
hi  Todo            guifg=#875f00   guibg=#ffffaf

