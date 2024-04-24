-- ++++++++++ leader/<Plug>/plug key +++++++++++
vim.g.mapleader = " "


-- ++++++++++++ applying new configs ++++++++++++
vim.keymap.set("n","<F12>",function ()
	vim.cmd.source()
	print("Change applied!")
end)


-- ++++++++++++ dealing with empty lines ++++++++++++
-- enter remap
vim.keymap.set("i","<CR>","<leader><BS><CR>")


-- ++++++++++++ reload current file ++++++++++++
vim.keymap.set("n","<A-r>",function ()
	vim.cmd.edit()
	local lualineOn,lualine = pcall(require,"lualine")
	if lualineOn then
		lualine.refresh()
	end
	print("Page reloaded!")
end)


-- ++++++++++++ copy & paste ++++++++++++
vim.keymap.set({"n","v"},"<leader>y","\"+y")
vim.keymap.set({"n","v"},"<leader>p","\"+p")
	-- these let me copy & paste with the outside world


-- ++++++++++++ suggestions & completion ++++++++++++
vim.keymap.set("i","<C-f>","<C-n>")
vim.keymap.set("i","<C-S-f>","<C-y>")


-- ++++++++++++ sometimes I just can't be bothered to write stuff, y'know? ++++++++++++
local print_statements = {
	["c"] = "printf(",
	["cs"] = "Console.WriteLine(",
	["go"] = "fmt.Println(",
	["hs"] = "putStrLn ",
	["html"] = "console.log(",
	["java"] = "System.out.println(",
	["js"] = "console.log(",
	["jsx"] = "console.log(",
	["lua"] = "print(",
	["ps1"] = "echo ",
	["py"] = "print(",
    ["rb"] = "puts ",
	["rs"] = "println!(",
    ["ts"] = "console.log(",
    ["tsx"] = "console.log(",
}
vim.keymap.set("i","<C-p>",function ()
	vim.cmd.normal("i"..print_statements[vim.fn.expand("%:e")])
    local startpos = vim.fn.getpos(".")
    vim.fn.cursor(startpos[2],startpos[3]+1)
end)


-- comment headers/comment highlighting
vim.keymap.set({"n","i"},"<A-m>",function ()
	vim.cmd.normal("i++++++++++++  ++++++++++++")
    local pos = vim.fn.getpos(".")
    vim.fn.cursor(pos[2],pos[3]-12)
    vim.cmd.startinsert()
end)
-- debug
vim.keymap.set({"n","i"},"<A-/>",function()
	vim.cmd.stopinsert()
	vim.cmd.normal("gcAdebug")
end)


-- ++++++++++++ searching/highlighting ++++++++++++
-- toggles whether searches are highlighted or not
vim.keymap.set("n","<leader>hh",function()
	vim.o.hlsearch = not vim.o.hlsearch
end)


-- ++++++++++++ changing modes +++++++++++++
vim.keymap.set("t","<C-[>","<C-\\><C-N>")
vim.keymap.set("t","<Esc>","<C-\\><C-N>")
vim.keymap.set("t","<C-PageUp>","<C-\\><C-N><C-PageUp>")
vim.keymap.set("t","<C-PageDown>","<C-\\><C-N><C-PageDown>")
-- save current buffer
vim.keymap.set({"n","i","v"},"<C-s>",function()
	vim.cmd.stopinsert()
	vim.cmd.write()
end)
vim.keymap.set({"n","i","v"},"<A-s>",function()
	vim.cmd.stopinsert()
	vim.cmd.write()
end)

-- going up & down in insert mode
vim.keymap.set("i","<PageUp>","<Up>")
vim.keymap.set("i","<PageDown>","<Down>")


-- ++++++++++++ folding & scrollling +++++++++++++
vim.cmd("map <A-j> <C-e>")
vim.cmd("map <A-k> <C-y>")
vim.cmd("map <C-j> <C-e>")
vim.cmd("map <C-k> <C-y>")
vim.keymap.set("n","H","zh")
vim.keymap.set("n","L","zl")
vim.cmd("map <A-h> zh")
vim.cmd("map <A-l> zl")


-- +++++++++++++ window stuff +++++++++++++
-- resizing the current window
-- this could have used vim.cmd("vertical resize +/-10") instead
vim.keymap.set("n","<A-=>",function()
	vim.cmd.wincmd("10>")
end)
vim.keymap.set("n","<A-->",function()
	vim.cmd.wincmd("10<")
end)
vim.keymap.set("n","<A-+>",function()
	vim.cmd.resize("+10")
end)
vim.keymap.set("n","<A-_>",function()
	vim.cmd.resize("-10")
end)
-- exiting a buffer/window
vim.keymap.set({"n","i","t"},"<A-w>",function ()
	local id = vim.fn.win_getid()
	vim.cmd.wincmd("l")
    if vim.fn.win_getid() == id then
        vim.cmd.wincmd("k")
    end
	if vim.fn.win_getid() == id then
		vim.cmd.wincmd("j")
	end
	vim.cmd.quit()
end)
vim.keymap.set({"n","i","t"},"<A-S-w>",function ()
	local id = vim.fn.win_getid()
	vim.cmd.wincmd("l")
    if vim.fn.win_getid() == id then
        vim.cmd.wincmd("k")
    end
	if vim.fn.win_getid() == id then
		vim.cmd.wincmd("j")
	end
	vim.cmd { cmd="bdelete", bang=true }
end)
-- vim.keymap.set("n","<A-S-d>",":bdelete term*<C-a><CR>")
-- navigating windows
basic_motions = {"h","j","k","l"}
for i = 1,4 do
	local move_cursor_map = string.format("<leader>w%s",basic_motions[i])
	vim.keymap.set("n",move_cursor_map,function ()
		vim.cmd.wincmd(tostring(vim.v.count1)..basic_motions[i])
	end)
	local move_win_map = string.format("<leader>ww%s",basic_motions[i])
	vim.keymap.set("n",move_win_map,function()
		vim.cmd.wincmd(string.upper(basic_motions[i]))
	end)
end


-- ++++++++++++ moving code around? visual mode?? ++++++++++++
vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")


-- ++++++++++++ tabs ++++++++++++
vim.keymap.set("n","H",function()
	vim.cmd.normal(tostring(vim.bo.tabstop).."h")
end)
vim.keymap.set("n","L",function()
	vim.cmd.normal(tostring(vim.bo.tabstop).."l")
end)
vim.keymap.set({"i","n"},"<A-BS>",function()
    vim.cmd.normal(string.format(
        "%dh%dx",
        tostring(vim.bo.tabstop),
        tostring(vim.bo.tabstop)
    ))
end)

-- ++++++++++++ substitution ++++++++++++
vim.keymap.set("n","<leader>rr",":.-5,.+5s/")
