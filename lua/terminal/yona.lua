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
			"cd "..vim.fn.expand("%:h").." && yona -s rg "..opts.fargs[1],
			true
		)
	end,
	{nargs=1}
)
vim.keymap.set({"n","i"},"<A-i>",":Yona test<CR>")
vim.keymap.set({"n","i"},"<A-S-i>",":Yona! test<CR>")
vim.keymap.set({"n","i"},"<A-o>",":Yona build<CR>")
vim.keymap.set({"n","i"},"<A-S-o>",":Yona! build<CR>")
vim.keymap.set({"n","i"},"<A-p>",":Yona run<CR>")
vim.keymap.set({"n","i"},"<A-S-p>",":Yona! run<CR>")


vim.keymap.set({"n","i"},"<A-j>",function()
	vim.cmd("!yona -f compile %:p")
end)
vim.keymap.set({"n","i"},"<A-S-j>",function()
	local path = vim.fn.expand("%:h")
	utils.terminal_vsplit("yona -f compile "..vim.fn.expand("%:p"))
end)

vim.keymap.set({"n","i"},"<A-k>",function()
	vim.cmd("!yona -f run %:p")
end)
vim.keymap.set({"n","i"},"<A-S-k>",function()
	utils.terminal_vsplit("yona -f run "..vim.fn.expand("%:p"))
end)
