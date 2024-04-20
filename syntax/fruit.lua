-- syntax highlighting for the fruit(TM) notation system 
-- that I'm making up right now

-- groups:
-- 	++++++++++++ {text} ++++++++++++
-- 	;; {text
-- 	- {text} \{
-- 	\{
-- 		{text}
-- 	\}
-- 	**{text}**
-- 	"{text}"

vim.cmd.syntax([[match fruitSection /- .* {\|\(^\|\s\)}/]])
vim.cmd.highlight("link fruitSection function")

vim.cmd.syntax("match fruitComment /#.*/")
vim.cmd.highlight("link fruitComment comment")

vim.o.commentstring = "#%s"

vim.cmd.syntax([[match fruitBold /\*\*[^*]*\*\*/]])
vim.cmd.highlight("link fruitBold exception")

vim.cmd.syntax([[region fruitString start=/"/ skip=/\\"/ end=/"/]])
vim.cmd.highlight("link fruitString string")

vim.cmd.syntax([[match fruitTitle /+.*+\|+{2,}/]])
vim.cmd.highlight("link fruitTitle include")

vim.cmd.syntax([[match fruitBullet />\|>>/]])
vim.cmd.highlight("link fruitBullet include")

vim.cmd.syntax("match fruitSeparator /;;/")
vim.cmd.highlight("link fruitSeparator operator")

vim.cmd.syntax([[match fruitArrow /<\?=>/]])
vim.cmd.highlight("link fruitArrow operator")

vim.cmd.syntax([[match fruitNumber /\d/]])
vim.cmd.highlight("link fruitNumber number")

vim.cmd.syntax([[match fruitURL /https:\/\/.*\/ /]])
vim.cmd.highlight("link fruitURL Special")

vim.cmd.syntax([[region fruitVariable start=/{/ end=/}/ skip=/\\}\|\\{/]])
vim.cmd.highlight("link fruitVariable Identifier")


vim.o.textwidth = 70
