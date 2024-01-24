-- module for any standalone user-defined commands that I make

vim.api.nvim_create_user_command(
	"Open",
	function()
		vim.cmd("!invoke-item "..vim.fn.expand("%:p"))
	end,
	{}
)
