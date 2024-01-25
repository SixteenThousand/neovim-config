local M = {}
local const = require("amber.constants")


function M.get_filepath(name)
	return string.format(const.SESS_FMT,name)
end

function M.get_amber_files()
	local results = {const.NO_SESS_OPT}
	for filename,_ in vim.fs.dir(const.SESS_LOC) do
		_,_,results[#results+1] = filename:find(const.SESS_PAT)
	end
	return results
end

function M.amber_load(name)
	if name == const.NO_SESS_OPT then
		print("No session needed buddy!")
	else
		vim.cmd.source(M.get_filepath(name))
	end
end

function M.amber_quit(name)
	if name == const.NO_SESS_OPT then
		vim.cmd.quitall()
	else
		vim.cmd("mksession! "..M.get_filepath(name))
		vim.cmd("quitall!")
	end
end

function M.amber_save(name)
	if name == const.NO_SESS_OPT then
		print(
			"Welp, don't blame me if lose your place in all those documents!"
		)
	else
		vim.cmd("mksession! "..M.get_filepath(name))
		print("Preserved in amber!")
	end
end

function M.amber_list()
	local results = ""
	for filename,_ in vim.fs.dir(const.SESS_LOC) do
		local _,_,session = filename:find(const.SESS_PAT)
		results = results..session.."\n"
	end
	print(results)
end

function M.amber_wipe(name)
	local fp = io.open(M.get_filepath(name), "w")
	fp:write(":echo 'This session has been wiped'")
	fp:close()
end

function M.amber_delete(name)
	os.remove(M.get_filepath(name))
end

return M
