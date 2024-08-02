vim.cmd.syntax("match clifmComment1 /#.*/")
vim.cmd.syntax("match clifmComment2 /;.*/")
vim.cmd.highlight("link clifmComment1 comment")
vim.cmd.highlight("link clifmComment2 comment")

vim.o.commentstring = ";%s"

vim.cmd.syntax([[match clifmSetting /^[^;#][^=]*/]])
vim.cmd.highlight("link clifmSetting Identifier")

vim.cmd.syntax([[match clifmOperator /=/]])
vim.cmd.highlight("link clifmOperator operator")
