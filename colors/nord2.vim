hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "nord2"

set background=dark

function! s:Highlight(group, fg, bg, opt)
    let l:str_fg = a:fg
    if type(a:fg) == v:t_number
        let l:str_fg = "#" . printf("%06x", a:fg)
    endif
    let l:str_bg = a:bg
    if type(a:bg) == v:t_number
        let l:str_bg = "#" . printf("%06x", a:bg)
    endif
    let l:cmd = "hi " . a:group . " guifg=" . l:str_fg . " guibg=" . l:str_bg
    if a:opt != ""
        let l:cmd = l:cmd . " gui=" . a:opt . " cterm=" . a:opt
    endif
    exec l:cmd
endfunction

function! s:Brighten(hex_code, offset)
    let l:red = min([0xff, a:hex_code % 0x1000000 / 0x10000 + a:offset])
    let l:green = min([0xff, a:hex_code % 0x10000 / 0x100 + a:offset])
    let l:blue = min([0xff, a:hex_code % 0x100 + a:offset])
    return 0x10000 * l:red + 0x100 * l:green + l:blue
endfunction

function! s:Darken(hex_code, offset)
    let l:red = max([0x00, a:hex_code % 0x1000000 / 0x10000 - a:offset])
    let l:green = max([0x00, a:hex_code % 0x10000 / 0x100 - a:offset])
    let l:blue = max([0x00, a:hex_code % 0x100 - a:offset])
    return 0x10000 * l:red + 0x100 * l:green + l:blue
endfunction


let s:nord0  = 0x2e3440
let s:nord1  = 0x3b4252
let s:nord2  = 0x434c5e
let s:nord3  = 0x4c566a
let s:nord4  = 0xd8dee9
let s:nord5  = 0xe5e9f0
let s:nord6  = 0xeceff4
let s:nord7  = 0x8fbcbb
let s:nord8  = 0x88c0d0
let s:nord9  = 0x81a1c1
let s:nord10 = 0x5e81ac
let s:nord11 = 0xbf616a
let s:nord12 = 0xd08770
let s:nord13 = 0xebcb8b
let s:nord14 = 0xa3be8c
let s:nord15 = 0xb48ead


let s:normal_fg         = s:nord4
let s:normal_bg         = s:nord0

let s:cursor_bg         = s:nord4
let s:selection_bg      = s:nord2
let s:border_bg         = s:nord1

let s:identifier_fg     = s:nord8
let s:statement_fg      = s:nord9
let s:comment_fg        = s:nord3
let s:status_line_bg    = s:nord3

let s:base_ui           = s:nord3


call s:Highlight("Normal", s:normal_fg, s:normal_bg, "NONE") 

" Comment Highlighting
" call s:Highlight("Comment", s:Brighten(s:normal_bg, 0x50), "NONE", "NONE")
call s:Highlight("Comment", s:Brighten(s:nord3, 0x10), "NONE", "NONE")

" Constant Highlighting
call s:Highlight("Constant", s:nord14, "NONE", "NONE")
call s:Highlight("String", s:nord14, "NONE", "NONE")
call s:Highlight("Character", s:nord14, "NONE", "NONE")
call s:Highlight("Number", s:nord15, "NONE", "NONE")
call s:Highlight("Boolean", s:nord9, "NONE", "NONE")
call s:Highlight("Float", s:nord15, "NONE", "NONE")

" Identifier Highlighting
call s:Highlight("Identifier", s:nord8, "NONE", "NONE")
call s:Highlight("Function", s:nord8, "NONE", "NONE")

" Statement Highlighting
call s:Highlight("Statement", s:nord9, "NONE", "NONE")
call s:Highlight("Conditional", s:nord9, "NONE", "NONE")
call s:Highlight("Repeat", s:nord9, "NONE", "NONE")
call s:Highlight("Label", s:nord9, "NONE", "NONE")
call s:Highlight("Operator", s:nord9, "NONE", "NONE")
call s:Highlight("Keyword", s:nord9, "NONE", "NONE")
call s:Highlight("Exception", s:nord9, "NONE", "NONE")

" PreProc Highlighting
call s:Highlight("PreProc", s:nord9, "NONE", "NONE")
call s:Highlight("Include", s:nord9, "NONE", "NONE")
call s:Highlight("Define", s:nord9, "NONE", "NONE")
call s:Highlight("Macro", s:nord9, "NONE", "NONE")
call s:Highlight("PreCondit", s:nord9, "NONE", "NONE")

" Type Highlighting
call s:Highlight("Type", s:nord9, "NONE", "NONE")
call s:Highlight("StorageClass", s:nord9, "NONE", "NONE")
call s:Highlight("Structure", s:nord9, "NONE", "NONE")
call s:Highlight("Typedef", s:nord9, "NONE", "NONE")

" Special Highlighting
call s:Highlight("Special", s:nord13, "NONE", "NONE")
call s:Highlight("SpecialChar", s:nord13, "NONE", "NONE")
call s:Highlight("Tag", s:nord4, "NONE", "NONE")
call s:Highlight("Delimiter", s:nord4, "NONE", "NONE")
call s:Highlight("SpecialComment", s:nord8, "NONE", "NONE")
call s:Highlight("Debug", s:nord4, "NONE", "NONE")


" Border Highlighting
call s:Highlight("StatusLine", s:nord8, s:base_ui, "NONE")
call s:Highlight("StatusLineNC", s:Darken(s:nord8, 0x20), s:base_ui, "NONE")
call s:Highlight("VertSplit", s:Darken(s:nord8, 0x40), s:base_ui, "NONE")
call s:Highlight("StatusLineTerm", s:nord8, s:base_ui, "NONE")
call s:Highlight("StatusLineTermNC", s:Darken(s:nord8, 0x20), s:base_ui, "NONE")

call s:Highlight("TabLine", s:normal_fg, s:base_ui, "NONE")
call s:Highlight("TabLineSel", "NONE", s:nord10, "NONE")
call s:Highlight("TabLineFill", s:Darken(s:normal_fg, 0x30), s:base_ui, "NONE")

call s:Highlight("Folded", s:Brighten(s:base_ui, 0x60), s:Brighten(s:base_ui, 0x00), "bold")
call s:Highlight("FoldColumn", s:Brighten(s:base_ui, 0x60), s:Brighten(s:base_ui, 0x00), "bold")

call s:Highlight("LineNr", s:Brighten(s:base_ui, 0x40), s:Darken(s:base_ui, 0x10), "bold")
call s:Highlight("CursorLineNr", s:Brighten(s:base_ui, 0x70), s:Darken(s:base_ui, 0x10), "bold")

call s:Highlight("ColorColumn", "NONE", s:Brighten(s:normal_bg, 0x08), "NONE")
call s:Highlight("SignColumn", s:Brighten(s:base_ui, 0x40), s:Brighten(s:base_ui, 0x10), "NONE")


" Cursor Highlighting

call s:Highlight("Cursor", "bg", s:normal_fg, "NONE") 
call s:Highlight("CursorLine", "NONE", s:Darken(s:base_ui, 0x10), "NONE")
call s:Highlight("CursorColumn", "NONE", s:Darken(s:base_ui, 0x10), "NONE")

call s:Highlight("Visual", "NONE", s:Brighten(s:selection_bg, 0x08), "NONE")
call s:Highlight("VisualNOS", "fg", "NONE", "underline")


" Completion Highlighting

call s:Highlight("Pmenu", "fg", s:base_ui, "NONE")
call s:Highlight("PmenuSel", "NONE", s:nord10, "NONE")
call s:Highlight("PmenuSbar", s:base_ui, s:Brighten(s:base_ui, 0x30), "NONE")
call s:Highlight("PmenuThumb", s:Brighten(s:base_ui, 0x30), s:base_ui, "NONE")
call s:Highlight("WildMenu", "NONE", s:nord10, "NONE")


" Syntax Highlighting

call s:Highlight("Error", s:Brighten(s:nord11, 0x20), s:Darken(s:nord11, 0x50), "NONE")
call s:Highlight("Todo", s:Brighten(s:nord13, 0x10), s:Darken(s:nord13, 0x60), "NONE")
call s:Highlight("ErrorMsg", s:nord11, "NONE", "NONE")
call s:Highlight("WarningMsg", s:nord13, "NONE", "NONE")


" Diff Highlighting

call s:Highlight("DiffAdd", "fg", s:Darken(s:nord14, 0x60), "NONE")
call s:Highlight("DiffChange", "fg", s:Darken(s:nord13, 0x70), "NONE")
call s:Highlight("DiffDelete", "fg", s:Darken(s:nord11, 0x50), "NONE")
call s:Highlight("DiffText", s:Brighten(s:nord13, 0x40), s:Darken(s:nord13, 0x70), "NONE")


" Search Highlighting

call s:Highlight("IncSearch", "bg", s:nord8, "NONE")
call s:Highlight("MatchParen", s:normal_bg, s:nord7, "NONE")
call s:Highlight("Search", "bg", s:nord12, "NONE")


" Misc Highlighting

call s:Highlight("Conceal", s:comment_fg, "NONE", "NONE")
call s:Highlight("Ignore", "bg", "NONE", "NONE")
call s:Highlight("NonText", s:nord2, "NONE", "NONE")
call s:Highlight("SpecialKey", s:nord3, "NONE", "NONE")

call s:Highlight("Directory", s:nord14, "NONE", "NONE")
call s:Highlight("ModeMsg", s:statement_fg, "NONE", "NONE")
call s:Highlight("MoreMsg", s:statement_fg, "NONE", "NONE")
call s:Highlight("Question", s:normal_fg, "NONE", "NONE")
call s:Highlight("Title", s:nord8, "NONE", "bold")
call s:Highlight("Underlined", "fg", "NONE", "NONE")


" Spelling Highlighting

exec "hi SpellBad gui=undercurl guisp=#" . printf("%06x", s:nord11)
exec "hi SpellCap gui=undercurl guisp=#" . printf("%06x", s:nord13)
exec "hi SpellRare gui=undercurl guisp=#" . printf("%06x", s:nord15)
exec "hi SpellLocal gui=undercurl guisp=#" . printf("%06x", s:nord14)
