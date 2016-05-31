setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=79

setlocal keywordprg=pydoc
setlocal makeprg=pylint\ -E\ -r\ n\ -f\ parseable\ %:p
setlocal efm=%A%f:%l:\ [%t%.%#]\ %m,%Z%p^^,%-C%.%#
setlocal omnifunc=

