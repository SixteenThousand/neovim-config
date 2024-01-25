local M = {}
local function sess_file(name)
	-- takes the name of a session and gives you the full filepath
	-- corresponding to that session
	return sessions_loc..name..ext
end

local function session_menu(title,action)
	local sessions_dir = vim.fs.dir(sessions_loc)
	local sessions = {no_session_opt}
	for filename,_ in sessions_dir do
		_,_,sessions[#sessions+1] = filename:find(pattern)
	end
	popup.create(sessions,{
		title = title,
		border = true,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		minwidth = #title + 20,
		callback = action,
	})
	vim.cmd.set("number")
	vim.cmd.set("relativenumber")
end

local function load_session(_,session_name)
	if session_name == no_session_opt then
		print("No session needed buddy!")
	else
		vim.cmd.quit()
		vim.cmd.source(sess_file(session_name))
	end
end


local function save_session(_,session_name)
	if session_name == no_session_opt then
		vim.cmd.quitall()
	else
		vim.cmd.quit()
		vim.cmd("mksession! "..sess_file(session_name))
		vim.cmd("quitall!")
	end
end

local function save_session_noquit(_,session_name)
	if session_name == no_session_opt then
		print(
			"Welp, don't blame me if lose your place in all those documents!"
		)
	else
		vim.cmd("mksession! "..sess_file(session_name))
		print("Session saved!")
	end
end



-- ++++++++++++ interface ++++++++++++
function M.LoadSession()
	session_menu("Load Session",load_session)
	vim.cmd.set("relativenumber")
end
function M.SaveSession()
	session_menu("Save Before You Leave!",save_session)
end
function M.SaveSessionNoQuit()
	session_menu("Save Session & Stay",save_session_noquit)
end

vim.api.nvim_create_user_command("LoadSession",M.LoadSession,{})
vim.api.nvim_create_user_command("SaveSession",M.SaveSession,{})
vim.api.nvim_create_user_command("NewSession", 
	function (argstable)
		vim.cmd.mksession(sess_file(argstable.args))
		print("New session <<"..argstable.args..">> made!")
	end,
	{ nargs=1}
)
vim.api.nvim_create_user_command("WipeSession",
	function (argstable)
		local fp = io.open(sess_file(argstable.args), "w")
		fp:write(":echo 'This session has been wiped'")
		fp:close()
		print("Session <<"..argstable.args..">> has been wiped clean!")
	end,
	{ nargs=1 }
)
vim.api.nvim_create_user_command("DeleteSession",
	function (argstable)
		os.remove(sess_file(argstable.args))
		print("Session <<"..argstable.args..">> deleted entirely!")
	end,
	{ nargs=1 }
)


return M
