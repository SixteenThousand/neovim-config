local ls = require("luasnip")
ls.setup_snip_env()


local START_SNIPPET = [[public class <> {
    public static void main(String[] args) {
        <>
    }
}]]

ls.add_snippets("java",{
    s("start",fmt(START_SNIPPET,{i(1),i(2)},{delimiters="<>"})),
})
