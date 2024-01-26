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
vim.keymap.set({"n","i"},"<C-t>",newtabex) 
vim.keymap.set({"n","i"},"<C-S-t>",function() vim.cmd.tabnew() end) 
vim.keymap.set("n","gr",function ()
	vim.cmd.tabprevious()
end)
