-- default places :find & co will look
-- note this used to be ".,/usr/include/,,"
vim.opt_global.path = { ".", "../**3" }

-- indentation & autocommenting
vim.go.smarttab = false
vim.opt_global.cpoptions:append("I")
     -- means autoindenting doesn't get deleted all the tim
-- tab width; buffer-local options
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true


-- keeps at least {number} lines beneath the cursor (unless at end of file)
vim.go.scrolloff = 2

-- autosaving
vim.go.autowrite = true
vim.go.autowriteall = true

-- allow h & l to take you to a new line
vim.opt_global.whichwrap:append("h,l")

-- let`s try horzontal scrolling; window option
vim.o.wrap = false

-- search stuff, incl. file & buffer search
vim.go.hlsearch = false
vim.go.ignorecase = false
vim.go.fileignorecase = true

-- change what "b" & "w" consider "words"
-- vim.opt_local.iskeyword:remove("_")

-- change what is displayed by the 'list' option
vim.opt_global.listchars = {
	space = "-",
	multispace = "---+",
	tab = "> ",
	nbsp = "+", -- honestly no idea what this one does but it is a default
}

-- getting spellcheck right; buffer option
vim.o.spelllang = "en_gb"

vim.go.showtabline = 0
