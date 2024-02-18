local M = {}

function M.is_windows()
	return vim.fn.has("win64") == 1
end

return M
