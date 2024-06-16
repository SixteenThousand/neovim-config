local ls = require("luasnip")
ls.setup_snip_env()

ls.add_snippets("gitcommit",{
    s("upr",fmt(">> update README",{})),
    s("upt",fmt(">> update TODO",{})),
})
