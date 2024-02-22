-- user-defined syntax highlighting
vim.api.nvim_create_autocmd({"BufEnter"}, {
	pattern = {"*.podon"},
	command = "set syntax=podon"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
	pattern = {"*.fruit"},
	command = "set syntax=fruit"
})


vim.api.nvim_create_autocmd(
	{"BufEnter"},
	{
		pattern = {"*.html"},
		callback = function(event)
			vim.bo.shiftwidth = 2
			vim.bo.expandtab = true
			vim.b.match_words = "<\\(\\w\\+\\)\\W:<\\/\\1"
		end
	}
)
