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

vim.cmd.syntax("match fruitSection /- .* {/")
vim.cmd.highlight("link fruitSection function")

vim.cmd.syntax("match fruitComment /#.*/")
vim.cmd.highlight("link fruitComment comment")

vim.o.cms = "#%s"

vim.cmd.syntax("match fruitBold /\\*\\*[^*]*\\*\\*/")
vim.cmd.highlight("link fruitBold exception")

vim.cmd.syntax("match fruitString /\"[^\"]*\"/")
vim.cmd.highlight("link fruitString string")

vim.cmd.syntax("match fruitTitle /++++++++++++ .* ++++++++++++/")
vim.cmd.highlight("link fruitTitle include")

vim.cmd.syntax("match fruitSeparator /;;/")
vim.cmd.highlight("link fruitSeparator operator")

vim.cmd.syntax("match fruitArrow /=>/")
vim.cmd.highlight("link fruitArrow operator")

vim.cmd.syntax("match fruitDoubleArrow /<=>/")
vim.cmd.highlight("link fruitDoubleArrow operator")

vim.cmd.syntax("match fruitNumber /\\d/")
vim.cmd.highlight("link fruitNumber number")

vim.cmd.syntax("match fruitURL /https:\\/\\/.*\\/ /")
vim.cmd.highlight("link fruitURL Special")


vim.o.textwidth = 70
