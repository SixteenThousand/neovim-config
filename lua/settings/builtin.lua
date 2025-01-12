-- default places search will look; note this used to be ".,/usr/include/,,"
-- "**2" means "look at any subdirectory that are at most 2 levels down"
vim.o.path = string.gsub(
	vim.fn.stdpath("config").."/**4,~/Projects/**4,~/temp,~/Downloads,.,",
	"~",
	os.getenv("HOME")
)

-- indentation & autocommenting
vim.o.smarttab = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.cmd.set("cpoptions+=I")
	-- means autoindenting doesn't get deleted all the time


-- buffers?? save?? saving?? idk what to call this bit
vim.o.autowrite = true
vim.opt.scrolloff = 2
	-- keeps at least {number} lines beneath the cursor (unless at end of file)

-- close & reload settings
vim.o.autowriteall = true

-- allow h & l to take you to a new line
vim.o.whichwrap="b,s,h,l"

-- let`s try horzontal scrolling
vim.o.wrap = false

-- search stuff, incl. file & buffer search
vim.o.hlsearch = false
vim.go.ignorecase = false
vim.go.fileignorecase = true

-- change what "b" & "w" consider "words"
-- vim.cmd.set("iskeyword-=_")

-- change what is displayed by the 'list' option
vim.opt.listchars = {
	space = "-",
	multispace = "---+",
	tab = "> ",
	nbsp = "+", -- honestly no idea what this one does but it is a default
}

-- getting spellcheck right
vim.o.spelllang = "en_gb"

vim.o.showtabline = 0

-- let :grep (not :vimgrep) search hidden files
if vim.o.grepprg:find("rg") == 1 then
    vim.o.grepprg = "rg --hidden --vimgrep -uu"
end
