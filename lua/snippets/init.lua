local luasnip = require("luasnip")


function source_snippets(opts)
    if opts ~= nil and opts.fargs[1] == "clean" then
        require("luasnip").cleanup()
    end
    require("snippets.javascript")
    require("snippets.tagged")
    require("snippets.sql")
    require("snippets.git")
    require("snippets.markdown")
    require("snippets.java")
end
vim.api.nvim_create_user_command("Snippets",source_snippets,{nargs="?"})

source_snippets()

-- keymaps
vim.keymap.set("i","<C-f>",luasnip.expand_or_jump)
vim.keymap.set("i","<C-b>",function()
    luasnip.jump(-1)
end)
