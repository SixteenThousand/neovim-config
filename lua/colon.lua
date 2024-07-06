-- module for any standalone user-defined commands that I make
local utils = require("utils")

-- system-open the current buffer (probably in a browser)
vim.api.nvim_create_user_command(
	"Open",
	function()
        if utils.is_windows() then
            vim.cmd("!invoke-item %")
        else
            vim.cmd("!xdg-open %")
        end
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
