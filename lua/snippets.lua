local luasnip = require("luasnip")
luasnip.setup_snip_env()


-- keymaps
vim.keymap.set("i","<C-f>",luasnip.expand_or_jump)
vim.keymap.set("i","<C-b>",function()
    luasnip.jump(-1)
end)


luasnip.add_snippets("gitcommit",{
    s("upr",fmt(">> update README",{})),
    s("upt",fmt(">> update TODO",{})),
    s("kb",fmt("key bindings",{})),
})

luasnip.add_snippets("java", {
    s("boiler",fmt(
[[public class <> {
    public static void main(String[] args) {
        <>
    }
}]],
        {i(1),i(2),},
        {delimiters="<>"}
    )),
    s("httphandler", fmt([[
import java.io.OutputStream;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;

public class <> implements HttpHandler {
    public void handle(HttpExchange exchange) throws IOException {
        exchange.sendResponseHeaders(<>,<>);
        OutputStream response = exchange.getResponseBody();
        <>
        response.close();
    }
}]],
        {i(1),i(2),i(3),i(4),},
        {delimiters="<>"}
    )),
})


luasnip.add_snippets("javascript",{
    s("des",fmt(
        [[describe("<>", () =>> {<>]],
        {i(1),i(2)},
        {delimiters="<>"}
    )),
    s("tes",fmt(
        [[test("<>", () =>> {<>]],
        {i(1),i(2)},
        {delimiters="<>"}
    )),
    s("tea",fmt(
        [[test("<>", async () =>> {<>]],
        {i(1),i(2)},
        {delimiters="<>"}
    )),
    s("ar",fmt(
        [[(<>) =>> {<>]],
        {i(1),i(2)},
        {delimiters="<>"}
    )),
    s("ex",fmt(
        [[expect.any({}]],
        {i(1)}
    )),
    s("portdf", fmt(
[[export default function <>() {
  <>
}]],
        {i(1),i(2)},
        {delimiters="<>"}
    )),
    s("portf", fmt(
[[export function <>() {
  <>
}]],
        {i(1),i(2)},
        {delimiters="<>"}
    )),
})

luasnip.add_snippets("javascriptreact",{
    s("portdf", fmt(
[[export default function <>({<>}) {
  <>
}]],
        {i(1),i(2),i(3)},
        {delimiters="<>"}
    )),
    s("portf", fmt(
[[export function <>({<>}) {
  <>
}]],
        {i(1),i(2),i(3)},
        {delimiters="<>"}
    )),
})




luasnip.add_snippets("markdown",{
    s("gh", fmt("https://github.com/{}/{}",{i(1),i(2)})),
    s("un", fmt("SixteenThousand",{})),
})


luasnip.add_snippets("sql",{
    s("sel", fmt( [[SELECT {} FROM {};]], {i(1),i(2)} )),
    s("selw", fmt( [[SELECT {} FROM {} WHERE {};]], {i(1),i(2),i(3)} )),
    s(
        "selj",
        fmt(
            [[SELECT {} FROM {} JOIN {} ON {}]],
            {i(1),i(2),i(3),i(4)}
        )
    ),
})

luasnip.add_snippets("html", {
    s("inp",fmt(
        [[<input id="{}" type="{}"{}>]],
        {i(1),i(2),i(3)}
    )),
    s("lab",fmt(
        [[<label for="{}"{}>{}</label>]],
        {i(1),i(2),i(3)}
    )),
    s("boiler",fmt(
[[<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="{}">
	<script src="{}" defer></script>
	<link rel="stylesheet" href="{}" />
	<title>{}</title>
</head>
<body>
  {}
</body>
</html>]],
        {i(1),i(2),i(3),i(4),i(5),}
    )),
    s("port{", fmt(
        [[import {<>} from '<>';]],
        {i(1),i(2)},
        {delimiters="<>"}
    )),
    s("port", fmt(
        [[import {} from '{}';]],
        {i(1),i(2)}
    )),
})

luasnip.add_snippets("svg", {
    s("boiler", fmt(
        [[<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">]],
        {}
    )),
})

luasnip.add_snippets("tex", {
    s("boiler",fmt(
[[\documentclass[12pt]{article}
    <b>
\begin{document}
    <a>
\end{document}]],
        {a=i(1),b=i(2)},
        {delimiters = "<>"}
    )),
    s("\\be",fmt(
[[\begin{<a>}
    \item <b>
\end{<a>}]],
        {a=i(1),b=i(2)},
        {
            delimiters = "<>",
            repeat_duplicates = true,
        }
    )),
})
