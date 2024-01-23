-- settings that have to be set for every buffer
vim.api.nvim_create_autocmd("BufEnter",{
	callback = function(evt)
		-- line numbers
		vim.cmd.set("number")
		vim.cmd.set("relativenumber")
		vim.cmd.set("noexpandtab")
		vim.cmd.set("formatoptions-=r formatoptions-=c formatoptions-=o")
		vim.cmd.set("textwidth=80")
	end
})


-- default places search will look; note this used to be ".,/usr/include/,,"
	-- "**2" means "look at any subdirectory that are at most 2 levels down"
vim.cmd.set("path=.,~/Documents/Programs/**2/,~/Documents/O-Backup_Management/,,")

-- indentation & autocommenting
vim.cmd.set("nosmarttab")
vim.cmd.set("shiftwidth=4")
vim.cmd.set("tabstop=4")
vim.cmd.set("cpoptions+=I")
	-- means autoindenting doesn't get deleted all the time


-- buffers?? save?? saving?? idk what to call this bit
vim.cmd.set("autowrite")
vim.opt.scrolloff = 4
	-- keeps at least {number} lines beneath the cursor (unless at end of file)

-- close & reload settings
vim.cmd.set("autowriteall")

-- allow h & l to take you to a new line
vim.cmd.set("whichwrap=b,s,h,l")
