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
    return path:gsub("\\","/"):gsub("~",os.getenv("HOME"))
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
        tostring(opts.var)
    ))
    fp:close()
end

-- gets the indentation of a given line as a string, accounting for the current 
-- values of expandtab & shiftwidth. Adds on extra indentation based on a given 
-- number of "tabs"; a "tab" here is just whatever comes out whenever the user 
-- presses the tab key in insert mode
--     @param line_num: int = the line no. of the given line
--     @param extra: int = the number of extra "tabs" to add on the end of the 
--     resulting string
function M.indent_string(line_num,extra)
    if vim.o.expandtab then
        local indent = vim.fn.indent(line_num) + extra * vim.o.shiftwidth
        return string.rep(" ",indent)
    else
        local indent = (vim.fn.indent(line_num) / vim.o.shiftwidth) + extra
        return string.rep("\t",indent)
    end
end

-- just stringifies a table.
--     @param depth: int = the recursion depth of the print, i.e., the maximum 
--     level of nesting that will be shown. Defaults to infinity
function M.stringify(t, depth)
    if type(t) ~= "table" then
        return tostring(t)
    end
    if depth ~= nil then
        depth = depth - 1
    end
    local s = "{"
    for k,v in pairs(t) do
        s = s..string.format("\n%s = %s,",k,M.stringify(v,depth))
    end
    if #s > 1 then
        s = s.."\n"
    end
    s = s.."}"
    return s
end


return M
