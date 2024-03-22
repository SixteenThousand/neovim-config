-- Note other modules within the utils folder should be imported explicity 
-- where used, and never imported here.
-- This file is for miscellaneous functions needed in other parts of the 
-- config only.

local M = {}


function M.is_windows()
	return vim.fn.has("win64") == 1
end

function M.path_exists(path)
    return vim.loop.fs_stat(path) ~= nil
end

function M.force_exist_dir(path)
    if not M.path_exists(path) then
        vim.fn.mkdir(path)
    end
end

function M.parse_path(path)
    -- converts a path to unix style & converts ~ to $HOME
    return path:gsub("\\","/"):gsub("~",os.getenv("home"))
end


-- logging
M.LOGDIR = M.parse_path(vim.fn.stdpath("data").."/thom-logs")
M.MAIN_LOGFILE = "main.log"
M.force_exist_dir(M.LOGDIR)

-- writes some output to a given logfile options are:
-- var: a variable to be logged. will be converted to a string
-- logfile: filename of a file in M.LOGDIR. defaults to M.MAIN_LOGFILE
-- msg: message to print before the variable value
function M.write_log(opts)
    local logpath = string.format("%s/%s",
        M.LOGDIR,
        opts.logfile or M.MAIN_LOGFILE
    )
    local fp = io.open(logpath,"a")
    fp:write(string.format(
        "\n%s; %s | <<%s>>",
        os.date(),
        opts.msg,
        tostring(opts.variable)
    ))
    fp:close()
end


return M
