local luasnip = require("luasnip")


-- filetype-specific snippets are sourced in lsp
require("snippets.javascript")
require("snippets.html")

-- keymaps
vim.keymap.set("i","<C-f>",luasnip.expand_or_jump)
vim.keymap.set("i","<C-b>",function()
    luasnip.jump(-1)
end)
