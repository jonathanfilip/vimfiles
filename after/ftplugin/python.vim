setlocal keywordprg=pydoc
setlocal makeprg=pylint\ -E\ -r\ n\ -f\ parseable\ %:p
setlocal efm=%A%f:%l:\ [%t%.%#]\ %m,%Z%p^^,%-C%.%#

