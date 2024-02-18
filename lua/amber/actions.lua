local M = {}

local SESS_LOC = vim.fn.stdpath("data").."/sessions"
local SESS_PAT = "(.+)%.amber%.vim"
local SESS_FMT = SESS_LOC.."/%s.amber.vim"
local NO_SESS_OPT = "continue sans session"


function M.get_filepath(name)
	return string.format(SESS_FMT,name)
end

function M.get_amber_files()
	local results = {NO_SESS_OPT}
	for filename,_ in vim.fs.dir(SESS_LOC) do
		_,_,results[#results+1] = filename:find(SESS_PAT)
	end
	return results
end

function M.amber_load(name)
	if name == NO_SESS_OPT then
		print("No session needed buddy!")
	else
		vim.cmd.source(M.get_filepath(name))
	end
end

function M.amber_quit(name)
	if name == NO_SESS_OPT then
		vim.cmd.quitall()
	else
		vim.cmd("mksession! "..M.get_filepath(name))
		vim.cmd("quitall!")
	end
end

function M.amber_save(name)
	if name == NO_SESS_OPT then
		print(
			"Welp, don't blame me if lose your place in all those documents!"
		)
	else
		vim.cmd("mksession! "..M.get_filepath(name))
		print("Session <"..name.."> has been preserved in amber!")
	end
end

function M.amber_list()
	local results = ""
	for filename,_ in vim.fs.dir(SESS_LOC) do
		local _,_,session = filename:find(SESS_PAT)
		results = results..session.."\n"
	end
	print(results)
end

function M.amber_wipe(name)
	local fp = io.open(M.get_filepath(name), "w")
	fp:write(":echo 'This session has been wiped'")
	fp:close()
	print("Session <"..name.."> has been wiped!")
end

function M.amber_delete(name)
	os.remove(M.get_filepath(name))
	print("Session <"..name.."> has been deleted entirely!")
end

return M
