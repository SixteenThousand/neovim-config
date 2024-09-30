set commentstring=#\ %s

set cindent

syntax keyword owlSpecial copy move link remove rename mkfile mkdir cp mv ln rm mf md
highlight link owlSpecial Special

syntax match owlCapture /([^)]*)/
highlight link owlCapture string

syntax match owlEscaped /\\.\|\[.*\]\|\*\|+/
highlight link owlEscaped operator

syntax match owlVariable /\$([^)]*)\|\$./
highlight link owlVariable Identifier

syntax match owlComment /^\s*# .*/
highlight link owlComment Comment
