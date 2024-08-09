local M = {}

local term_utils = require("terminal.utils")

local repls = {
	["haskell"] = "ghci",
	["java"] = "jshell",
	["javascript"] = "node",
	["lisp"] = "sbcl",
    ["lua"] = "lua",
	["python"] = "python",
}
function M.start_repl()
	term_utils.terminal_vsplit(
        repls[vim.bo.filetype] or term_utils.shell,true)
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
