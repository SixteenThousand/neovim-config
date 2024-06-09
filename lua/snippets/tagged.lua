local ls = require("luasnip")
ls.setup_snip_env()

ls.cleanup() -- for debugging snippets

ls.add_snippets("html",{
    s("inp",fmt(
        [[<input type="{}"{}>]],
        {i(1),i(2)}
    )),
    s("lab",fmt(
        [[<label for="{}"{}>{}</label>]],
        {i(1),i(2),i(3)}
    )),
    -- s("t",fmt(
    --     [[<{}>{}</{}>]],
    --     {i(1),i(2),i(1)}
    -- )),
})
