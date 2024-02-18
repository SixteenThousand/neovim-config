-- module for use of telescope in navigation
local tlscp = require("telescope.builtin")
local popup = require("utils.popup")

vim.keymap.set("n","<leader>ff",function ()
	tlscp.find_files({
		["no_ignore"] = true,
		["search_dirs"] = {
			"~/Projects",
			"~/temp",
			"~/Downloads",
			vim.fn.stdpath("config")
		}
	})
end)
vim.keymap.set("n","<leader>fb",tlscp.buffers)
vim.keymap.set("n","<leader>fh",tlscp.help_tags)
vim.keymap.set("n","<leader>fj",tlscp.jumplist)

local get_dirs_cmd = table.concat( 
	{
		"pwsh -c",
		"\"Get-ChildItem ~ -Directory -Recurse -Depth 4",
		"| Select-Object -ExpandProperty FullName\"",
	},
	" "
)
vim.keymap.set("n","<leader>ed",function()
	local shell_output = io.popen(get_dirs_cmd,"r")
	local dirs = {}
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
			vim.cmd.edit(path)
		end
	)
end)
