-- ++++++++++++ telescope ++++++++++++
local scopeOn,tlscp = pcall(require,"telescope.builtin")
if scopeOn then
	vim.keymap.set("n","<leader>ff",function ()
		tlscp.find_files({
			["no_ignore"] = true,
			["search_dirs"] = {
				"~/Projects",
				vim.fn.stdpath("config")
			}
		})
	end)
	vim.keymap.set("n","<leader>fb",tlscp.buffers)
	vim.keymap.set("n","<leader>fh",tlscp.help_tags)
end
