local luasnip = require("luasnip")


-- keymaps
vim.keymap.set("i","<C-f>",luasnip.expand_or_jump)
vim.keymap.set("i","<C-b>",function()
    luasnip.jump(-1)
end)


-- filetype-specific snippets
require("snippets.javascript")
