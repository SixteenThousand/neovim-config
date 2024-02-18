-- general navigation remaps; remaps for related to more specific things
-- are in their respective modules
vim.keymap.set("n","<leader>ee",":buffer ")
vim.keymap.set("n","<leader>es",":sbuffer ")

vim.keymap.set("n","<leader>eh",function ()
	vim.cmd.edit("~/Projects/Learning")
	vim.o.number = true
end)

vim.keymap.set("n","<leader>ea",function ()
	vim.cmd.edit("~/Projects")
	vim.o.number = true
end)
vim.keymap.set("n","<leader>et",function ()
	vim.cmd.edit("~/temp")
	vim.o.number = true
end)

vim.keymap.set("n","<leader>e'",function ()
    vim.cmd.edit(vim.fn.stdpath("config"))
	vim.o.number = true
end)
vim.keymap.set("n","<leader>e;",function ()
    vim.cmd.edit(vim.fn.stdpath("data"))
	vim.o.number = true
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
