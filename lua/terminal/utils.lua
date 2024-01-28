-- this is mainly here to hold the "make terminal window" function
local M = {}

-- creates a new window to the right of the current one, and starts a terminal
-- in that window with a command, if given, and with the currently working 
-- directory being the parent of the current buffer
-- cmd: string; the command to be run by the new terminal.
-- 	Note that you won`t be able to interact with the terminal after the 
-- 	command is run, unless that command starts an interactive process
-- 	(e.g. a REPL) or if this is set to nil, in which case it just opens a 
-- 	terminal
-- focus: boolean; If true, moves the cursor to the new window. Otherwise
-- 	cursor is kept in current window.
function M.terminal_vsplit(cmd,focus)
	-- first check whether there is already a window to the right of the 
	-- current one
	local winid = vim.fn.win_getid()
	vim.cmd.wincmd("l")
	if winid ~= vim.fn.win_getid() then
		-- is this other window a terminal?
		is_term,_ = vim.fn.bufname():find("term://")
		if is_term == nil then
			vim.cmd.wincmd("h")
			vim.cmd.vsplit()
			vim.cmd.wincmd("l")
		end
	else
		vim.cmd.vsplit()
		vim.cmd.wincmd("l")
	end
	if cmd == "" then
		vim.cmd.terminal()
	else
		vim.cmd.terminal(cmd)
	end
	vim.o.bufhidden = "delete"
	if not focus then
		vim.cmd.wincmd("h")
	end
end


return M
