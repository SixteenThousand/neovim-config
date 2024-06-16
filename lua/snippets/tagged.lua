local ls = require("luasnip")
ls.setup_snip_env()


local tag_snippets = {
    s("inp",fmt(
        [[<input id="{}" type="{}"{}>]],
        {i(1),i(2),i(3)}
    )),
    s("lab",fmt(
        [[<label for="{}"{}>{}</label>]],
        {i(1),i(2),i(3)}
    )),
    s("htmlmeta",fmt(
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
    s("port{", fmt([[import {<>} from '<>';]], {i(1),i(2)},
        {delimiters="<>"})),
    s("port", fmt([[import {} from '{}';]], {i(1),i(2)})),
    s("svg", fmt(
        [[<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">]],
        {}))
}

local tag_fts = {
    "html",
    "svg",
}

for i = 1,#tag_fts do
    ls.add_snippets(tag_fts[i], tag_snippets)
end

