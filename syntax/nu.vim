runtime! syntax/javascript.vim

set commentstring=#\ %s

syntax match nuComment /^\s*# .*/
highlight link nuComment Comment

syntax sync ccomment nuComment
