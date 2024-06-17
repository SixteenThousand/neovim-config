local ls = require("luasnip")
ls.setup_snip_env()

ls.add_snippets("markdown",{
    s("gh",fmt("https://github.com/{}/{}",{i(1),i(2)})),
    s("un",fmt("SixteenThousand",{})),
})
