syn match markdownListMarker "^\s*[-*+]\%(\s\+\S\)\@=" contained
syn match markdownOrderedListMarker "^\s*\<\d\+\.\%(\s*\S\)\@=" contained

hi! def link markdownError Normal

