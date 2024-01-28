-- time to write a new version of yona???

local utils = require("terminal.utils")

vim.api.nvim_create_user_command(
	"Yona",
	function(opts)
		local yona = "!cd "..vim.fn.expand("%:h").." && yona "..opts.fargs[1]
		if opts.bang then
			utils.terminal_vsplit(yona)
		else
			vim.cmd(yona)
		end
	end,
	{nargs=1}
)
vim.keymap.set({"n","i"},"<A-i>",":Yona build")
vim.keymap.set({"n","i"},"<A-S-i>",":Yona! build")


vim.keymap.set({"n","i"},"<A-o>",function()
	local path = vim.fn.expand("%:h")
	local name,_ = vim.fn.expand("%:t"):gsub("%..*$","")
	local ext = vim.fn.expand("%:e")
	vim.cmd("!yona compile -p "..path.." -n "..name.." -e "..ext)
end)
vim.keymap.set({"n","i"},"<A-S-o>",function()
	local path = vim.fn.expand("%:h")
	local name,_ = vim.fn.expand("%:t"):gsub("%..*$","")
	local ext = vim.fn.expand("%:e")
	utils.terminal_vsplit("!yona compile -p "..path.." -n "..name.." -e "..ext)
end)

vim.keymap.set({"n","i"},"<A-p>",function()
	local path = vim.fn.expand("%:h")
	local name,_ = vim.fn.expand("%:t"):gsub("%..*$","")
	local ext = vim.fn.expand("%:e")
	vim.cmd("!yona run -p "..path.." -n "..name.." -e "..ext)
end)
vim.keymap.set({"n","i"},"<A-S-p>",function()
	local path = vim.fn.expand("%:h")
	local name,_ = vim.fn.expand("%:t"):gsub("%..*$","")
	local ext = vim.fn.expand("%:e")
	utils.terminal_vsplit("yona run -p "..path.." -n "..name.." -e "..ext)
end)
