-- module for any standalone user-defined commands that I make

-- open current file in broswer (i.e. firefox)
vim.api.nvim_create_user_command(
    "Fox",
    function()
        vim.cmd("!firefox --new-tab %")
    end,
    {}
)

-- get path of current buffer
vim.api.nvim_create_user_command(
	"Path",
	function(opts)
        if opts.fargs[1] == nil then
            vim.fn.setreg("\"",vim.fn.expand("%:p"))
            print("path yanked to register \"\"")
        else
            vim.fn.setreg(opts.fargs[1],vim.fn.expand("%:p"))
            print("path yanked to register \""..opts.fargs[1])
        end
	end,
	{nargs="?"}
)

--[[
Inserts a list of identical lines with numbers (integers) in them, counting up.
Parameters represent {expression lower_bound upper_bound} in that order.
Put a `%d` in the expression parameter wherever you want the number to appear.
--]]
vim.api.nvim_create_user_command(
    "Number",
    function(opts)
        local startline = vim.fn.getcurpos()[2]
        local numbered_list = {}
        for i=tonumber(opts.fargs[2]),tonumber(opts.fargs[3]) do
            numbered_list[#numbered_list+1] = opts.fargs[1]:gsub("%%d",tostring(i))
        end
        vim.api.nvim_buf_set_lines(0,startline,startline,nil,numbered_list)
    end,
    { nargs = "*", bang = true }
)

-- trying to recreate vim-fugitive but for mercurial
vim.api.nvim_create_user_command(
    "Hg",
    function(opts)
        vim.cmd("!cd %:h && hg "..(opts.fargs[1] or ""))
    end,
    {nargs="?"}
)


-- Ex-mode abbreviations
vim.cmd([[
    cnoreabbrev Man vertical Man
]])
