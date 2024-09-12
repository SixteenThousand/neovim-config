local ls = require("luasnip")
ls.setup_snip_env()

ls.add_snippets("tex", {
    s("\\be",fmt([[
    \begin{<a>}
        \item <b>
    \end{<a>}
    ]], {
        a = i(1), b = i(2)
    }, {
        delimiters = "<>",
        repeat_duplicates = true,
    })),
})
