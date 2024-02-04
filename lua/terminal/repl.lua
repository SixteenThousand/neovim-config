local utils = require("terminal.utils")

local repls = {
	["cs"] = "csi",
	["hs"] = "ghci",
	["java"] = "jshell",
	["js"] = "node",
	["lisp"] = "sbcl",
	["py"] = "python",
}
function start_repl()
	utils.terminal_vsplit(repls[vim.fn.expand("%:e")],true)
end

vim.api.nvim_create_user_command(
	"Repl",
	function(opts)
		if #opts.fargs == 0 then
			start_repl()
		else
			utils.terminal_vsplit(repls[opts.fargs[1]],true)
		end
	end,
	{nargs="?"}
)

vim.keymap.set("n","<leader>tr",start_repl)
