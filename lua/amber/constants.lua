local M = {}

M.SESS_LOC = vim.fn.stdpath("data").."\\sessions"
M.SESS_PAT = "(.+)%.amber%.vim"
M.SESS_FMT = M.SESS_LOC.."\\%s.amber.vim"
M.NO_SESS_OPT = "continue sans session"

return M
