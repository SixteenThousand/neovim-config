local ls = require("luasnip")
ls.setup_snip_env()

ls.cleanup() -- for debugging snippets

ls.add_snippets("sql",{
    s("sel",fmt(
        [[SELECT {} FROM {};]],
        {i(1),i(2)})),
    s("selw", fmt([[SELECT {} FROM {} WHERE {};]], {i(1),i(2),i(3)})),
    s(
        "selj",
        fmt([[SELECT {} FROM {} JOIN {} ON {}]],
        {i(1),i(2),i(3),i(4)})
    ),
})
