local ls = require("luasnip")
ls.setup_snip_env()


ls.add_snippets("tex",{
    s("blo", fmt(
[[\begin{<>}
<>
\end{<>}]], {i(1),i(2),i(1)}, { delimiters="<>" })),
})
