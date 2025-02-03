-- default places :find & co will look
-- note this used to be ".,/usr/include/,,"
vim.opt_global.path = { ".", "./**3", "../**3" }

-- indentation & autocommenting
vim.go.smarttab = false
vim.opt_global.cpoptions:append("I")
     -- means autoindenting doesn't get deleted all the time
-- tab width
vim.o.shiftwidth = 4 -- buffer opt
vim.o.tabstop = 4 -- buffer opt
vim.o.expandtab = true -- buffer opt
-- vim.opt_local.formatoptions:remove{ "r", "o", "l" }
    -- stops vim from auto-inserting a bunch of comments


-- keeps at least {number} lines beneath the cursor (unless at end of file)
vim.go.scrolloff = 2

-- autosaving
vim.go.autowrite = true
vim.go.autowriteall = true

-- line wrapping/line width
-- allow h & l to take you to a new line
vim.opt_global.whichwrap:append("h,l")
vim.o.wrap = false -- window opt
vim.o.textwidth = 76

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

vim.o.number = true
vim.o.relativenumber = true

vim.go.splitright = true
vim.go.splitbelow = true
