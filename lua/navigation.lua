vim.keymap.set("n","<leader>ee",":buffer ")

vim.keymap.set("n","<leader>eh",function ()
	vim.cmd.edit("~/Projects/Learning")
	vim.cmd.set("number")
end)

vim.keymap.set("n","<leader>ea",function ()
	vim.cmd.edit("~/Projects")
	vim.cmd.set("number")
end)

vim.keymap.set("n","<leader>e'",function ()
    vim.cmd.edit(vim.fn.stdpath("config"))
	vim.cmd.set("number")
end)

vim.keymap.set("n","-",function ()
	vim.cmd.edit("%:h")
end)

-- tab stuff
function newtabex()
	vim.cmd.tabnew("%:h")
end
vim.keymap.set({"n","i"},"<C-t>", newtabex) 
vim.keymap.set("n","gr",function ()
	vim.cmd.tabprevious()
end)


--[[-- ++++++++++++ telescope ++++++++++++
local tlscp = require "telescope.builtin"
vim.keymap.set("n","<leader>ff",function ()
	tlscp.find_files({
		["no_ignore"] = true,
		["search_dirs"] = {
			"~/Projects",
			vim.fn.stdpath("config")
		}
	})
end)
vim.keymap.set("n","<leader>fb",tlscp.buffers,{})
vim.keymap.set("n","<leader>fh",tlscp.help_tags,{})]]
