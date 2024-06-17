local ls = require("luasnip")
ls.setup_snip_env()


ls.add_snippets("javascript",{
    s("des",fmt(
        [[describe("<>", () =>> {<>]],
        {i(1),i(2)},{delimiters="<>"})),
    s("tes",fmt(
        [[test("<>", () =>> {<>]],
        {i(1),i(2)},{delimiters="<>"})),
    s("tea",fmt(
        [[test("<>", async () =>> {<>]],
        {i(1),i(2)},{delimiters="<>"})),
    s("ar",fmt(
        [[(<>) =>> {<>]],
        {i(1),i(2)},{delimiters="<>"})),
    s("ex",fmt(
        [[expect.any({}]],
        {i(1)})),
    s("portdf", fmt(
        [[export default function <>() {
  <>
}]],
        {i(1),i(2)},
        {delimiters="<>"})),
    s("portf", fmt(
        [[export function <>() {
  <>
}]],
        {i(1),i(2)},
        {delimiters="<>"})),
})

ls.add_snippets("javascriptreact",{
    s("portdf", fmt(
        [[export default function <>({<>}) {
  <>
}]],
        {i(1),i(2),i(3)},
        {delimiters="<>"})),
    s("portf", fmt(
        [[export function <>({<>}) {
  <>
}]],
        {i(1),i(2),i(3)},
        {delimiters="<>"})),
})
