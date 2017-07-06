
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "lucius24dark"

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


let s:normal_fg         = 0xb8c8d8
let s:normal_bg         = 0x202838
let s:normal_bg         = 0x182838

let s:cursor_bg         = 0x6090b0
let s:selection_bg      = 0xb0d0f0
let s:status_line_bg    = 0x90b0c0

let s:statement_fg      = 0x80d0f0
let s:comment_fg        = s:Brighten(s:normal_bg, 0x60)
let s:constant_fg       = 0xd0d0b0
let s:special_fg        = 0xc0b0d0
let s:identifier_fg     = 0xa0c090
let s:preproc_fg        = 0x80d0b0
let s:type_fg           = 0x80d0d0


call s:Highlight("Normal", s:normal_fg, s:normal_bg, "NONE") 

" Syntax Highlighting
call s:Highlight("Statement", s:statement_fg, "NONE", "NONE")
call s:Highlight("Comment", s:comment_fg, "NONE", "NONE")
call s:Highlight("Constant", s:constant_fg, "NONE", "NONE")
call s:Highlight("Special", s:special_fg, "NONE", "NONE")
call s:Highlight("Identifier", s:identifier_fg, "NONE", "NONE")
call s:Highlight("PreProc", s:preproc_fg, "NONE", "NONE")
call s:Highlight("Type", s:type_fg, "NONE", "NONE")

call s:Highlight("StatusLine", s:normal_bg, s:status_line_bg, "bold")
call s:Highlight("StatusLineNC", s:Darken(s:status_line_bg, 0x60), s:status_line_bg, "NONE")
call s:Highlight("VertSplit", s:Darken(s:status_line_bg, 0x60), s:status_line_bg, "NONE")

call s:Highlight("Folded", s:status_line_bg, s:Darken(s:status_line_bg, 0x40), "bold")
call s:Highlight("FoldColumn", s:status_line_bg, s:Darken(s:status_line_bg, 0x40), "bold")

call s:Highlight("TabLine", s:normal_bg, s:status_line_bg, "NONE")
call s:Highlight("TabLineSel", "NONE", s:selection_bg, "NONE")
call s:Highlight("TabLineFill", s:Darken(s:status_line_bg, 0x40), s:status_line_bg, "NONE")

call s:Highlight("Cursor", "bg", s:cursor_bg, "NONE") 
call s:Highlight("CursorLine", "NONE", s:Brighten(s:normal_bg, 0x10), "NONE")
call s:Highlight("CursorColumn", "NONE", s:Brighten(s:normal_bg, 0x10), "NONE")

call s:Highlight("LineNr", s:comment_fg, s:Brighten(s:normal_bg, 0x10), "bold")
call s:Highlight("CursorLineNr", s:status_line_bg, s:Brighten(s:normal_bg, 0x10), "bold")

call s:Highlight("ColorColumn", "NONE", s:Brighten(s:normal_bg, 0x05), "NONE")
call s:Highlight("SignColumn", s:Brighten(s:normal_bg, 0x80), s:Brighten(s:normal_bg, 0x20), "NONE")

call s:Highlight("Visual", "NONE", s:selection_bg, "NONE")
call s:Highlight("VisualNOS", "fg", "NONE", "underline")

call s:Highlight("Pmenu", "bg", s:status_line_bg, "NONE")
call s:Highlight("PmenuSel", "NONE", s:selection_bg, "NONE")
call s:Highlight("PmenuSbar", s:status_line_bg, s:Brighten(s:status_line_bg, 0x30), "NONE")
call s:Highlight("PmenuThumb", s:Brighten(s:status_line_bg, 0x30), s:status_line_bg, "NONE")
call s:Highlight("WildMenu", "NONE", s:selection_bg, "NONE")

call s:Highlight("Error", 0xb00000, 0xe0b0b0, "NONE")
call s:Highlight("ErrorMsg", 0xb00000, "NONE", "NONE")
call s:Highlight("Todo", 0x906000, 0xf0f0b0, "NONE")
call s:Highlight("WarningMsg", 0xb06000, "NONE", "NONE")

call s:Highlight("Conceal", s:comment_fg, "NONE", "NONE")
call s:Highlight("Ignore", "bg", "NONE", "NONE")
call s:Highlight("NonText", 0xa0a0d0, "NONE", "NONE")
call s:Highlight("SpecialKey", 0xa0d0a0, "NONE", "NONE")

call s:Highlight("Directory", 0x009060, "NONE", "NONE")
call s:Highlight("ModeMsg", 0x0060b0, "NONE", "NONE")
call s:Highlight("MoreMsg", 0x0060b0, "NONE", "NONE")
call s:Highlight("Question", s:normal_fg, "NONE", "NONE")
call s:Highlight("Title", s:statement_fg, "NONE", "bold")
call s:Highlight("Underlined", "fg", "NONE", "NONE")

call s:Highlight("IncSearch", "fg", 0x60e0e0, "NONE")
call s:Highlight("MatchParen", "NONE", 0x80e0c0, "NONE")
call s:Highlight("Search", "fg", 0xf0b000, "NONE")

call s:Highlight("DiffAdd", "fg", 0xa0d0a0, "NONE")
call s:Highlight("DiffChange", "fg", 0xd0d0a0, "NONE")
call s:Highlight("DiffDelete", "fg", 0xd0a0a0, "NONE")
call s:Highlight("DiffText", 0xe06000, 0xd0d0a0, "bold")


" Not going to bother with custom functions for these
hi SpellBad       gui=undercurl guisp=#c00000
hi SpellCap       gui=undercurl guisp=#0090c0
hi SpellRare      gui=undercurl guisp=#409000
hi SpellLocal     gui=undercurl guisp=#d08000

