-- module for any standalone user-defined commands that I make

-- system-open the current buffer (probably in a browser)
vim.api.nvim_create_user_command(
	"Open",
	function()
		vim.cmd("!invoke-item "..vim.fn.expand("%:p"))
	end,
	{}
)


-- spellcheck
vim.api.nvim_create_user_command(
	"Spell",
	function ()
		vim.cmd.setlocal("spell spelllang=en_gb")
	end,
	{}
)
vim.api.nvim_create_user_command(
	"Nospell",
	function ()
		vim.cmd.setlocal("nospell")
	end,
	{}
)

-- enter "Text mode"; enable a bunch of options that make writing long blocks of
-- text much easier
vim.api.nvim_create_user_command(
	"Paragraph",
	function()
		vim.cmd.setlocal("formatoptions+=t formatoptions+=a formatoptions+=w")
	end,
	{}
)
vim.api.nvim_create_user_command(
	"NoParagraph",
	function()
		vim.cmd.setlocal("formatoptions-=t formatoptions-=a formatoptions-=w")
	end,
	{}
)
