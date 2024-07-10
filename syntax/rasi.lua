-- syntax highlighting for rofi config file
vim.cmd.syntax([[match rasiIdentifier /^\s*[^:{}]\+/]])
vim.cmd.highlight("link rasiIdentifier Identifier")

-- vim.cmd.syntax([[region rasiCommment start=/\/\* / end=/ \*\//]])
vim.cmd.syntax([[match rasiComment /\s*\/\/ .*/]])
vim.cmd.highlight("link rasiComment Comment")

vim.o.commentstring = [[// %s]]

vim.cmd.syntax([[match rasiNumber /\d/]])
vim.cmd.highlight("link rasiNumber Number")

vim.cmd.syntax([[region rasiString start=/"/ end=/"/ skip=/\\"/]])
vim.cmd.highlight("link rasiString String")

vim.cmd.syntax([[match rasiBoolean /true\|false/]])
vim.cmd.highlight("link rasiBoolean Boolean")
