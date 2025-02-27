local M = {}

local utils = require("utils")

local SESS_DIR = vim.fn.stdpath("data").."/amber-sessions"
local SESS_PAT = "(.+)%.amber%.vim"
local SESS_FMT = SESS_DIR.."/%s.amber.vim"
local NO_SESS_OPT = "continue sans session"
local LOCAL_SESS_FILE = ".amber.vim"

utils.force_exist_dir(SESS_DIR)

function M.get_filepath(name)
	return string.format(SESS_FMT,name)
end

function M.get_amber_files()
	local results = {NO_SESS_OPT}
	for filename,_ in vim.fs.dir(SESS_DIR) do
		_,_,results[#results+1] = filename:find(SESS_PAT)
	end
	return results
end

function M.load(name)
	if name ~= NO_SESS_OPT then
        vim.cmd("%bd!")
		vim.cmd.source(M.get_filepath(name))
	end
end

function M.quit(name)
	if name == NO_SESS_OPT then
		vim.cmd.quitall({bang=true})
	else
		vim.cmd("mksession! "..M.get_filepath(name))
        vim.cmd.quitall({bang=true})
	end
end

function M.save(name)
	if name ~= NO_SESS_OPT then
		vim.cmd("mksession! "..M.get_filepath(name))
		print("Session <"..name.."> has been preserved in amber!")
	end
end

function M.list()
	local results = ""
	for filename,_ in vim.fs.dir(SESS_DIR) do
		local _,_,session = filename:find(SESS_PAT)
		results = results..session.."\n"
	end
	print(results)
end

function M.wipe(name)
	local fp = io.open(M.get_filepath(name), "w")
	fp:write(":echo 'This session has been wiped'")
	fp:close()
	print("Session <"..name.."> has been wiped!")
end

function M.delete(name)
	os.remove(M.get_filepath(name))
	print("Session <"..name.."> has been deleted entirely!")
end

return M
