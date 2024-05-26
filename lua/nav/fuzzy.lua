-- module for use of telescope in navigation
local tlscp = require("telescope.builtin")
local popup = require("utils.popup")
local utils = require("utils")

vim.keymap.set("n","<leader>ff",function ()
	tlscp.find_files({
		["no_ignore"] = true,
		["search_dirs"] = {
			"~/Projects",
			"~/temp",
			"~/Downloads",
			vim.fn.stdpath("config"),
		},
        previewer = false,
	})
end)
vim.keymap.set("n","<leader>fb",function()
    tlscp.buffers({previewer = false})
end)
vim.keymap.set("n","<leader>fh",function()
    tlscp.help_tags({previewer = true})
end)
vim.keymap.set("n","<leader>fj",function()
    tlscp.jumplist({previewer = false})
end)

local get_dirs_cmd
local MOVE_TO_MAXDEPTH = 5
if utils.is_windows() then
    get_dirs_cmd = table.concat(
        {
            "pwsh -c",
            "\"Get-ChildItem ~ -Directory -Recurse -Depth ",
            tostring(MOVE_TO_MAXDEPTH),
            "| Select-Object -ExpandProperty FullName\"",
        },
        " "
    )
else
    get_dirs_cmd = table.concat({
        "cd $HOME",
        "&&",
        "find * -type d",
        "-maxdepth",
        tostring(MOVE_TO_MAXDEPTH),
    }, " ")
end
local shell_output = io.popen(get_dirs_cmd,"r")
local dirs = {}
vim.keymap.set("n","<leader>ed",function()
	while true do
		local line = shell_output:read()
		if line == nil then
			break
		else
			dirs[#dirs+1] = line
		end
	end
	popup.telescope_dropdown(
		"Move To!",
		dirs,
		function(path)
			vim.cmd.edit(os.getenv("HOME").."/"..path)
		end
	)
end)
