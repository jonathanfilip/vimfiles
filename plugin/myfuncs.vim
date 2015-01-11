" My vim autoload functions
" Author: Jonathan Filip

if !exists("g:projects")
    let g:projects = {}
endif

if !exists("g:databases")
    let g:databases = {}
endif

" colors
command! Colors call myfuncs#EditColors()

" Tags
command! Tags call myfuncs#GenerateTags(fnamemodify(bufname('%'), \':p:h'), 0) " current file dir
command! TagsForce call myfuncs#GenerateTags(fnamemodify(bufname('%'), \':p:h'), 1) " current file dir, force
command! TagsCwd call myfuncs#GenerateTags(getcwd(), 0) " current cwd
command! TagsCwdForce call myfuncs#GenerateTags(getcwd(), 1) " cwd, force

" Database
command! -nargs=1 -complete=file Sqlite :call myfuncs#LoadSqlite(<q-args>)
command! -nargs=1 -complete=custom,myfuncs#DatabaseComplete Database :call
            \ myfuncs#LoadDatabase(<q-args>)
command! -nargs=1 -complete=custom,myfuncs#DatabaseComplete Data :call
            \ myfuncs#LoadDatabase(<q-args>)

" Projects
command! -nargs=1 -complete=custom,myfuncs#ProjectComplete Project :call
            \ myfuncs#LoadProject(<q-args>)
command! -nargs=1 -complete=custom,myfuncs#ProjectComplete Proj :call
            \ myfuncs#LoadProject(<q-args>)

" Mappings
noremap <C-f> :call myfuncs#ToggleSearchHighlighting()<CR>
nnoremap <F10> :call myfuncs#ToggleTextWidth()<CR>
nnoremap <S-F10> :call myfuncs#ToggleWrap()<CR>
nnoremap <F11> :call myfuncs#ToggleSpellCheck()<CR>
nnoremap <F12> :call myfuncs#ToggleScrollbars()<CR>
nnoremap <Leader>tw :call myfuncs#ToggleTextWidth()<CR>

" Python
if has("python")
    command! -range EvalPythonRange call myfuncs#EvaluateCurrentRange()
    noremap <silent> <F5> :EvalPythonRange<CR>
endif

