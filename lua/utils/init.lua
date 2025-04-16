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
    if vim.bo.expandtab then
        local indent = vim.fn.indent(line_num) + extra * vim.bo.shiftwidth
        return string.rep(" ",indent)
    else
        local indent = (vim.fn.indent(line_num) / vim.bo.shiftwidth) + extra
        return string.rep("\t",indent)
    end
end

-- just stringifies a table.
--     @param t: table = the table to be stringified
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

-- determines the "project toplevel" directory of the current buffer, using
-- yona (see the "terminal.yona" module).
-- Mostly this will just be the git repo toplevel
--     @param allow_error: boolean = if true, then when yona cannot find the 
--     project directory, the function will throw an error. Else it will return 
--     the parent of the current buffer.
function M.get_project_dir(allow_error)
    local yona_pipe = io.popen("cd "..vim.fn.expand("%:h").." && yona -s pwd 2>/dev/null","r")
    local yona_result = yona_pipe:read()
    if (not allow_error) and yona_result == nil then
        return vim.fn.expand("%:h")
    end
    yona_pipe:close()
    return yona_result
end

-- gets the (relative to directory vim was opened in) path of the current fern 
-- buffer
function M.get_fern_path()
    return vim.fn.expand("%:p"):match("fern://.*/file://(.*)%$$")
end


return M
