local M = {}

local term_utils = require("terminal.utils")

local repls = {
	["cs"] = "csi",
	["hs"] = "ghci",
	["java"] = "jshell",
	["js"] = "node",
	["lisp"] = "sbcl",
    ["lua"] = "lua",
	["py"] = "python",
}
function M.start_repl()
	term_utils.terminal_vsplit(
        repls[vim.fn.expand("%:e")] or term_utils.shell,true)
end

vim.api.nvim_create_user_command(
	"Repl",
	function(opts)
		if #opts.fargs == 0 then
			M.start_repl()
		else
			term_utils.terminal_vsplit(opts.fargs[1],true)
		end
	end,
	{nargs="?"}
)

return M
