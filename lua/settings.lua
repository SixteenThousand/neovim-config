-- settings that have to be set for every buffer
vim.api.nvim_create_autocmd("BufEnter",{
	callback = function(evt)
		-- line numbers
		vim.o.number = true
		vim.o.relativenumber = true
		vim.o.expandtab = false
		vim.cmd.set("formatoptions-=r formatoptions-=c formatoptions-=o")
		vim.o.textwidth = 80
	end
})


-- default places search will look; note this used to be ".,/usr/include/,,"
	-- "**2" means "look at any subdirectory that are at most 2 levels down"
vim.cmd.set("path=.,~/Documents/Programs/**2/,~/Documents/O-Backup_Management/,,")

-- indentation & autocommenting
vim.o.smarttab = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.cmd.set("cpoptions+=I")
	-- means autoindenting doesn't get deleted all the time


-- buffers?? save?? saving?? idk what to call this bit
vim.o.autowrite = true
vim.opt.scrolloff = 4
	-- keeps at least {number} lines beneath the cursor (unless at end of file)

-- close & reload settings
vim.o.autowriteall = true

-- allow h & l to take you to a new line
vim.o.whichwrap="b,s,h,l"


-- let`s try horzontal scrolling
vim.o.wrap = false
