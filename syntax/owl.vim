set commentstring=#\ %s

set cindent

syntax keyword owlSpecial range copy move link remove
highlight link owlSpecial Special

syntax match owlCapture /([^)]*)/
highlight link owlCapture string

syntax match owlEscaped /\\.\|\[.*\]\|\*\|+/
highlight link owlEscaped operator

syntax match owlVariable /\$([^)]*)\|\$./
highlight link owlVariable Identifier

syntax match owlComment /^\s*# .*/
highlight link owlComment Comment
