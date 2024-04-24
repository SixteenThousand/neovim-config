-- time to write a new version of yona???

local utils = require("terminal.utils")

vim.api.nvim_create_user_command(
	"Yona",
	function(opts)
		local yona = "cd "..vim.fn.expand("%:h").." && yona "..opts.fargs[1]
		if opts.bang then
			utils.terminal_vsplit(yona)
		else
			vim.cmd("!"..yona)
		end
	end,
	{nargs=1,bang=true}
)
vim.api.nvim_create_user_command(
	"RipgrepYona",
	function(opts)
		utils.terminal_vsplit(
			"cd "..vim.fn.expand("%:h").." && yona sh rg "..opts.fargs[1],
			true
		)
	end,
	{nargs=1}
)
vim.keymap.set({"n","i"},"<A-i>",":Yona build<CR>")
vim.keymap.set({"n","i"},"<A-S-i>",":Yona! build<CR>")
vim.keymap.set({"n","i"},"<A-u>",":Yona test<CR>")
vim.keymap.set({"n","i"},"<A-S-u>",":Yona! test<CR>")


vim.keymap.set({"n","i"},"<A-o>",function()
	vim.cmd("!yona -s compile "..vim.fn.expand("%:p"))
end)
vim.keymap.set({"n","i"},"<A-S-o>",function()
	local path = vim.fn.expand("%:h")
	utils.terminal_vsplit("yona -s compile "..vim.fn.expand("%:p"))
end)

vim.keymap.set({"n","i"},"<A-p>",function()
	vim.cmd("!yona -s run "..vim.fn.expand("%:p"))
end)
vim.keymap.set({"n","i"},"<A-S-p>",function()
	utils.terminal_vsplit("yona -s run "..vim.fn.expand("%:p"))
end)
