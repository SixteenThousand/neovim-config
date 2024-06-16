-- general navigation remaps; remaps for related to more specific things
-- are in their respective modules
vim.keymap.set("n","<leader>ee",":buffer ")
-- vim.keymap.set("n","<leader>es",":sbuffer ")
vim.keymap.set("n","<leader>ef",":find ")

vim.keymap.set("n","<leader>el",function ()
	vim.cmd.edit("~/Projects/Learning")
	vim.o.number = true
end)

vim.keymap.set("n","<leader>ep",function ()
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
vim.keymap.set("n","<leader>e#",function ()
    vim.cmd.edit(os.getenv("XDG_CONFIG_HOME") or "~/.config")
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
vim.keymap.set("t","<C-t>",vim.cmd.tabnew)
vim.keymap.set({"n","i","t"},"<A-Left>",vim.cmd.tabprev)
vim.keymap.set({"n","i","t"},"<A-Right>",vim.cmd.tabnext)
