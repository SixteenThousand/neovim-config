-- syntax highlighting for PODcast Object Notation

vim.cmd.syntax("keyword podonType move copy")
vim.cmd.highlight("link podonType type")

vim.cmd.syntax("match podonComment /#.*/")
vim.cmd.highlight("link podonComment comment")

vim.cmd.syntax("match podonSeparator /,/")
vim.cmd.highlight("link podonSeparator operator")
