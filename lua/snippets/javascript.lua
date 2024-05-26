local ls = require("luasnip")
ls.setup_snip_env()

-- ls.cleanup() -- for debugging snippets

ls.add_snippets("javascript",{
    s("des",fmt([[describe("<>", () =>> {<>});]], {i(1),i(2)},{delimiters="<>"})),
    s("tes",fmt([[test("<>", () =>> {<>});]], {i(1),i(2)},{delimiters="<>"})),
})
