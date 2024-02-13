-- module for use of telescope in navigation
local tlscp = require("telescope.builtin")
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
