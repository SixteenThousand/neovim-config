local utils = require("terminal.utils")

vim.api.nvim_create_user_command(
	"Yona",
	function(opts)
		local yona = "cd "..vim.fn.expand("%:h").." && yona "..opts.fargs[1]
		if opts.bang then
			utils.terminal_vsplit(yona)
		else
			vim.cmd("!"..yona..TERM_CTRL_CHARS_FILTER)
		end
	end,
	{nargs=1,bang=true}
)

vim.keymap.set({"n","i"},"<A-i>",":Yona test<CR>")
vim.keymap.set({"n","i"},"<A-S-i>",":Yona! test<CR>")
vim.keymap.set({"n","i"},"<A-o>",":Yona build<CR>")
vim.keymap.set({"n","i"},"<A-S-o>",":Yona! build<CR>")
vim.keymap.set({"n","i"},"<A-p>",":Yona run<CR>")
vim.keymap.set({"n","i"},"<A-S-p>",":Yona! run<CR>")


vim.keymap.set({"n","i"},"<A-j>",function()
	vim.cmd("!yona -f compile %:p"..TERM_CTRL_CHARS_FILTER)
end)
vim.keymap.set({"n","i"},"<A-S-j>",function()
	local path = vim.fn.expand("%:h")
	utils.terminal_vsplit("yona -f compile "..vim.fn.expand("%:p"))
end)

vim.keymap.set({"n","i"},"<A-k>",function()
	vim.cmd("!yona -f run %:p"..TERM_CTRL_CHARS_FILTER)
end)
vim.keymap.set({"n","i"},"<A-S-k>",function()
	utils.terminal_vsplit("yona -f run "..vim.fn.expand("%:p"))
end)

-- grep with yona, or yonagrep
vim.go.grepformat = "%f:%l,%f:%l%m,%f  %l%m"
vim.go.grepprg = table.concat({
    "cd %:h &&",
    "grep -RHIn",
    "--exclude-dir .git --exclude-dir node_modules",
    "$* $(yona -s pwd 2>/dev/null)",
}, " ")
