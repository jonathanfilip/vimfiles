
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "artoo"

set background=light


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

function! s:Adjust(hex_code, factor)
    let l:red = min([0xff, float2nr(round(a:hex_code % 0x1000000 / 0x10000 * (1 + a:factor)))])
    let l:green = min([0xff, float2nr(round(a:hex_code % 0x10000 / 0x100 * (1 + a:factor)))])
    let l:blue = min([0xff, float2nr(round(a:hex_code % 0x100 * (1 + a:factor)))])
    return 0x10000 * l:red + 0x100 * l:green + l:blue
endfunction

function! s:AdjustRGB(hex_code, rfactor, gfactor, bfactor)
    let l:red = min([0xff, float2nr(round(a:hex_code % 0x1000000 / 0x10000 * (1 + a:rfactor)))])
    let l:green = min([0xff, float2nr(round(a:hex_code % 0x10000 / 0x100 * (1 + a:gfactor)))])
    let l:blue = min([0xff, float2nr(round(a:hex_code % 0x100 * (1 + a:bfactor)))])
    return 0x10000 * l:red + 0x100 * l:green + l:blue
endfunction

let s:blue = 0x1f77b4
let s:orange = 0xff7f0e
let s:green = 0x2ca02c
let s:red = 0xd62728
let s:purple = 0x9467bd
let s:brown = 0x8c564b
let s:pink = 0xe377c2
let s:grey = 0x7f7f7f
let s:jungle_green = 0xbcbd22
let s:cyan = 0x17becf
let s:white = 0xffffff
let s:black = 0x000000
let s:ncs_blue = 0x0087bd
let s:ncs_yellow = 0xffd300
let s:ncs_red = 0xc40233
let s:ncs_green = 0x009f6b
let s:yellow = s:ncs_yellow

let s:normal_fg         = s:black
let s:normal_bg         = s:white

let s:cursor_bg         = s:cyan
let s:selection_bg      = s:AdjustRGB(s:normal_bg, -0.3, -0.2, -0.0)

let s:constant_fg       = s:orange
let s:identifier_fg     = s:green
let s:statement_fg      = s:blue
let s:preproc_fg        = s:cyan
let s:type_fg           = s:ncs_blue
let s:special_fg        = s:purple

let s:comment_fg        = s:grey

let s:border_bg         = s:Adjust(s:normal_bg, -0.4)
let s:border_fg         = s:normal_bg
let s:faded_border_bg   = s:Adjust(s:normal_bg, -0.2)
let s:border_faded_fg   = s:Adjust(s:normal_bg, 0.6)
let s:focused_bg        = s:selection_bg



call s:Highlight("Normal", s:normal_fg, s:normal_bg, "NONE") 

" Comment Highlighting
call s:Highlight("Comment", s:comment_fg, "NONE", "NONE")

" Constant Highlighting
call s:Highlight("Constant", s:constant_fg, "NONE", "NONE")
call s:Highlight("String", s:constant_fg, "NONE", "NONE")
call s:Highlight("Character", s:constant_fg, "NONE", "NONE")
call s:Highlight("Number", s:constant_fg, "NONE", "NONE")
call s:Highlight("Boolean", s:constant_fg, "NONE", "NONE")
call s:Highlight("Float", s:constant_fg, "NONE", "NONE")

" Identifier Highlighting
call s:Highlight("Identifier", s:identifier_fg, "NONE", "NONE")
call s:Highlight("Function", s:identifier_fg, "NONE", "NONE")

" Statement Highlighting
call s:Highlight("Statement", s:statement_fg, "NONE", "NONE")
call s:Highlight("Conditional", s:statement_fg, "NONE", "NONE")
call s:Highlight("Repeat", s:statement_fg, "NONE", "NONE")
call s:Highlight("Label", s:statement_fg, "NONE", "NONE")
call s:Highlight("Operator", s:statement_fg, "NONE", "NONE")
call s:Highlight("Keyword", s:statement_fg, "NONE", "NONE")
call s:Highlight("Exception", s:statement_fg, "NONE", "NONE")

" PreProc Highlighting
call s:Highlight("PreProc", s:preproc_fg, "NONE", "NONE")
call s:Highlight("Include", s:preproc_fg, "NONE", "NONE")
call s:Highlight("Define", s:preproc_fg, "NONE", "NONE")
call s:Highlight("Macro", s:preproc_fg, "NONE", "NONE")
call s:Highlight("PreCondit", s:preproc_fg, "NONE", "NONE")

" Type Highlighting
call s:Highlight("Type", s:type_fg, "NONE", "NONE")
call s:Highlight("StorageClass", s:type_fg, "NONE", "NONE")
call s:Highlight("Structure", s:type_fg, "NONE", "NONE")
call s:Highlight("Typedef", s:type_fg, "NONE", "NONE")

" Special Highlighting
call s:Highlight("Special", s:purple, "NONE", "NONE")
call s:Highlight("SpecialChar", s:purple, "NONE", "NONE")
call s:Highlight("Tag", s:purple, "NONE", "NONE")
call s:Highlight("Delimiter", s:purple, "NONE", "NONE")
call s:Highlight("SpecialComment", s:purple, "NONE", "NONE")
call s:Highlight("Debug", s:purple, "NONE", "NONE")

" Border Highlighting
call s:Highlight("StatusLine", s:border_fg, s:border_bg, "NONE")
call s:Highlight("StatusLineNC", s:border_faded_fg, s:border_bg, "NONE")
call s:Highlight("VertSplit", s:border_faded_fg, s:border_bg, "NONE")
call s:Highlight("StatusLineTerm", s:border_fg, s:border_bg, "NONE")
call s:Highlight("StatusLineTermNC", s:border_faded_fg, s:border_bg, "NONE")

call s:Highlight("TabLine", s:border_fg, s:border_bg, "NONE")
call s:Highlight("TabLineSel", s:normal_fg, s:focused_bg, "NONE")
call s:Highlight("TabLineFill", s:border_faded_fg, s:border_bg, "NONE")

call s:Highlight("ToolbarLine", s:border_fg, s:border_bg, "NONE")
call s:Highlight("ToolbarButton", s:normal_fg, s:focused_bg, "NONE")

call s:Highlight("Folded", s:Adjust(s:normal_fg, 0.3), s:Adjust(s:normal_bg, -0.2), "NONE")
call s:Highlight("FoldColumn", s:Adjust(s:normal_fg, 0.3), s:Adjust(s:normal_bg, -0.2), "NONE")

call s:Highlight("LineNr", s:Adjust(s:normal_bg, -0.4), s:faded_border_bg, "NONE")
call s:Highlight("CursorLineNr", s:Adjust(s:normal_bg, -0.6), s:faded_border_bg, "NONE")

call s:Highlight("ColorColumn", "NONE", s:Adjust(s:normal_bg, -0.1), "NONE")
call s:Highlight("SignColumn", s:Adjust(s:normal_bg, -0.5), s:faded_border_bg, "NONE")


call s:Highlight("Cursor", "bg", s:AdjustRGB(s:normal_bg, -0.3, -0.2, -0.0) , "NONE") 
call s:Highlight("CursorLine", "NONE", s:faded_border_bg, "NONE")
call s:Highlight("CursorColumn", "NONE", s:faded_border_bg, "NONE")

call s:Highlight("Visual", "NONE", s:selection_bg, "NONE")
call s:Highlight("VisualNOS", "fg", "NONE", "underline")


" Completion Highlighting

call s:Highlight("Pmenu", s:normal_bg, s:border_bg, "NONE")
call s:Highlight("PmenuSel", s:normal_fg, s:focused_bg, "NONE")
call s:Highlight("PmenuSbar", s:border_bg, s:Adjust(s:border_bg, -0.2), "NONE")
call s:Highlight("PmenuThumb", s:normal_fg, s:Adjust(s:border_bg, 0.4), "NONE")
call s:Highlight("WildMenu", s:normal_fg, s:focused_bg, "NONE")


" Syntax Highlighting

call s:Highlight("Error", s:AdjustRGB(s:normal_bg, -0.3, -0.8, -0.8), s:AdjustRGB(s:normal_bg, -0.0, -0.4, -0.4), "NONE")
call s:Highlight("Todo", s:AdjustRGB(s:normal_bg, -0.4, -0.5, -0.8), s:AdjustRGB(s:normal_bg, -0.0, -0.0, -0.4), "NONE")
call s:Highlight("ErrorMsg", s:red, "NONE", "NONE")
call s:Highlight("WarningMsg", s:yellow, "NONE", "NONE")
call s:Highlight("WarningMsg", s:AdjustRGB(s:normal_bg, -0.2, -0.4, -0.8), "NONE", "NONE")


" Diff Highlighting

call s:Highlight("DiffAdd", "fg", s:AdjustRGB(s:normal_bg, -0.3, -0.1, -0.3), "NONE")
call s:Highlight("DiffDelete", "fg", s:AdjustRGB(s:normal_bg, -0.0, -0.4, -0.4), "NONE")
call s:Highlight("DiffChange", "fg", s:AdjustRGB(s:normal_bg, -0.1, -0.1, -0.4), "NONE")
call s:Highlight("DiffText", s:AdjustRGB(s:normal_bg, -0.0, -0.6, -1.0), s:AdjustRGB(s:normal_bg, -0.1, -0.1, -0.4), "NONE")

" Search Highlighting

call s:Highlight("IncSearch", "fg", s:AdjustRGB(s:normal_bg, -0.5, -0.1, -0.0), "NONE")
call s:Highlight("MatchParen", s:normal_bg, s:orange, "NONE")
call s:Highlight("Search", "fg", s:AdjustRGB(s:normal_bg, -0.0, -0.3, -0.5), "NONE")


" Misc Highlighting

call s:Highlight("Conceal", s:comment_fg, "NONE", "NONE")
call s:Highlight("Ignore", "bg", "NONE", "NONE")
call s:Highlight("NonText", s:AdjustRGB(s:normal_bg, -0.4, -0.4, -0.2), "NONE", "NONE")
call s:Highlight("SpecialKey", s:AdjustRGB(s:normal_bg, -0.4, -0.2, -0.4), "NONE", "NONE")

call s:Highlight("Directory", s:blue, "NONE", "NONE")
call s:Highlight("ModeMsg", s:statement_fg, "NONE", "NONE")
call s:Highlight("MoreMsg", s:statement_fg, "NONE", "NONE")
call s:Highlight("Question", s:normal_fg, "NONE", "NONE")
call s:Highlight("Title", s:identifier_fg, "NONE", "bold")
call s:Highlight("Underlined", "fg", "NONE", "NONE")


" Spelling Highlighting

let s:spell_hi = "guibg"
let s:spell_factor = -0.3
if has("gui_running")
    let s:spell_hi = "guisp"
    let s:spell_factor = 0.0
endif
exec "hi SpellBad gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:red, s:spell_factor)) . " cterm=underline"
exec "hi SpellCap gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:yellow, s:spell_factor)) . " cterm=underline"
exec "hi SpellRare gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:purple, s:spell_factor)) . " cterm=underline"
exec "hi SpellLocal gui=undercurl " . s:spell_hi . "=#" . printf("%06x", s:Adjust(s:green, s:spell_factor)) . " cterm=underline"
