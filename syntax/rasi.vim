" syntax highlighting for rofi config file
syn match rasiIdentifier /^\s*[^:{}]\+/
hi link rasiIdentifier Identifier

syn match rasiComment /\s*\/\/.*/
hi link rasiComment Comment
" syn region rasiBlockCommment start=+/\*+ end=+\*/+
" hi def link rasiBlockComment Comment
set commentstring=//\ %s

syn match rasiNumber /\d\|#[0-9a-f]\+/
hi link rasiNumber Number

syn region rasiString start=/"/ end=/"/ skip=/\\"/
hi link rasiString String

syn match rasiBoolean /true\|false/
hi link rasiBoolean Boolean
