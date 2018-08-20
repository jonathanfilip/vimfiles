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


call s:Highlight("Normal", s:normal_fg, s:normal_bg, "NONE") 

" Comment Highlighting
call s:Highlight("Comment", s:Brighten(s:nord3, 0x20), "NONE", "NONE")

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
call s:Highlight("Special", s:nord4, "NONE", "NONE")
call s:Highlight("SpecialChar", s:nord13, "NONE", "NONE")
call s:Highlight("Tag", s:nord4, "NONE", "NONE")
call s:Highlight("Delimiter", s:nord4, "NONE", "NONE")
call s:Highlight("SpecialComment", s:nord8, "NONE", "NONE")
call s:Highlight("Debug", s:nord4, "NONE", "NONE")


" Border Highlighting
call s:Highlight("StatusLine", s:nord8, s:nord3, "bold")
call s:Highlight("StatusLineNC", s:Darken(s:status_line_bg, 0x60), s:status_line_bg, "NONE")
call s:Highlight("VertSplit", s:Darken(s:status_line_bg, 0x60), s:status_line_bg, "NONE")

" Syntax Highlighting


call s:Highlight("Folded", s:status_line_bg, s:Darken(s:status_line_bg, 0x40), "bold")
call s:Highlight("FoldColumn", s:status_line_bg, s:Darken(s:status_line_bg, 0x40), "bold")

call s:Highlight("TabLine", s:normal_bg, s:status_line_bg, "NONE")
call s:Highlight("TabLineSel", "NONE", s:selection_bg, "NONE")
call s:Highlight("TabLineFill", s:Darken(s:status_line_bg, 0x40), s:status_line_bg, "NONE")

call s:Highlight("Cursor", "bg", s:cursor_bg, "NONE") 
call s:Highlight("CursorLine", "NONE", s:Brighten(s:normal_bg, 0x20), "NONE")
call s:Highlight("CursorColumn", "NONE", s:Brighten(s:normal_bg, 0x20), "NONE")

call s:Highlight("LineNr", s:comment_fg, s:Brighten(s:normal_bg, 0x20), "bold")
call s:Highlight("CursorLineNr", s:status_line_bg, s:Brighten(s:normal_bg, 0x20), "bold")

call s:Highlight("ColorColumn", "NONE", s:Brighten(s:normal_bg, 0x05), "NONE")
call s:Highlight("SignColumn", s:Brighten(s:normal_bg, 0x80), s:Brighten(s:normal_bg, 0x30), "NONE")

call s:Highlight("Visual", "NONE", s:selection_bg, "NONE")
call s:Highlight("VisualNOS", "fg", "NONE", "underline")

call s:Highlight("Pmenu", "bg", s:status_line_bg, "NONE")
call s:Highlight("PmenuSel", "NONE", s:selection_bg, "NONE")
call s:Highlight("PmenuSbar", s:status_line_bg, s:Brighten(s:status_line_bg, 0x30), "NONE")
call s:Highlight("PmenuThumb", s:Brighten(s:status_line_bg, 0x30), s:status_line_bg, "NONE")
call s:Highlight("WildMenu", "NONE", s:selection_bg, "NONE")

call s:Highlight("Error", 0xf08080, 0x800000, "NONE")
call s:Highlight("ErrorMsg", 0xf06060, "NONE", "NONE")
call s:Highlight("Todo", 0xd0d060, 0x606000, "NONE")
call s:Highlight("WarningMsg", 0xc09060, "NONE", "NONE")

call s:Highlight("Conceal", s:comment_fg, "NONE", "NONE")
call s:Highlight("Ignore", "bg", "NONE", "NONE")
call s:Highlight("NonText", 0x606080, "NONE", "NONE")
call s:Highlight("SpecialKey", 0x608060, "NONE", "NONE")

call s:Highlight("Directory", s:identifier_fg, "NONE", "NONE")
call s:Highlight("ModeMsg", s:statement_fg, "NONE", "NONE")
call s:Highlight("MoreMsg", s:statement_fg, "NONE", "NONE")
call s:Highlight("Question", s:normal_fg, "NONE", "NONE")
call s:Highlight("Title", s:statement_fg, "NONE", "bold")
call s:Highlight("Underlined", "fg", "NONE", "NONE")

call s:Highlight("IncSearch", "fg", 0x30b0b0, "NONE")
call s:Highlight("IncSearch", "fg", 0x30b0b0, "NONE")
call s:Highlight("MatchParen", "NONE", 0x70a000, "NONE")
call s:Highlight("Search", "fg", 0xc07000, "NONE")

call s:Highlight("DiffAdd", "fg", 0x608060, "NONE")
call s:Highlight("DiffChange", "fg", 0x808060, "NONE")
call s:Highlight("DiffDelete", "fg", 0x806060, "NONE")
call s:Highlight("DiffText", 0xe0e070, 0x808060, "NONE")


" Not going to bother with custom functions for these
hi SpellBad       gui=undercurl guisp=#f06060
hi SpellCap       gui=undercurl guisp=#60b0d0
hi SpellRare      gui=undercurl guisp=#409000
hi SpellLocal     gui=undercurl guisp=#d0b060

