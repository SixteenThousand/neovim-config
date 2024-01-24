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
	require("lualine").refresh()
	print("Page reloaded!")
end)


-- ++++++++++++ copy & paste ++++++++++++
vim.keymap.set({"n","v"},"<leader>y","\"+y")
vim.keymap.set({"n","v"},"<leader>p","\"+p")
	-- these let me copy & paste with the outside world


-- ++++++++++++ suggestions & completion ++++++++++++
vim.keymap.set("i","<C-c>","<C-n>")
vim.keymap.set("i","<C-d>","<C-y>")


-- ++++++++++++ sometimes I just can't be bothered to write stuff, y'know? ++++++++++++
local print_statements = {
	["java"] = "System.out.println(",
	["cs"] = "Console.WriteLine(",
	["rs"] = "println!(",
	["hs"] = "putStrLn ",
	["js"] = "console.log(",
	["html"] = "console.log(",
	["py"] = "print(",
	["lua"] = "print(",
	["c"] = "printf(\"%d\\n\", ",
	["ps1"] = "echo "
}
vim.keymap.set("i","<C-p>",function ()
	vim.cmd.normal("i"..print_statements[vim.fn.expand("%:e")])
end)


-- comment headers/comment highlighting
vim.keymap.set("i","<A-m>",function ()
	vim.cmd.normal("i++++++++++++  ++++++++++++")
	vim.cmd.normal("12h")
end)


-- ++++++++++++ searching/highlighting ++++++++++++
vim.keymap.set("n","<leader>\\",vim.cmd.nohlsearch)
	-- gets rid of any pesky search highlighting


-- ++++++++++++ changing modes +++++++++++++
vim.keymap.set("t","<C-[>","<C-\\><C-N>")
vim.keymap.set("t","<Esc>","<C-\\><C-N>")
vim.keymap.set("t","<C-PageUp>","<C-\\><C-N><C-PageUp>")
vim.keymap.set("t","<C-PageDown>","<C-\\><C-N><C-PageDown>")
-- save current buffer
vim.keymap.set({"n","i"},"<C-s>",function()
	vim.cmd.stopinsert()
	vim.cmd.write()
end)


-- ++++++++++++ folding & scrollling +++++++++++++
vim.keymap.set("n","zf",function() vim.cmd.set("foldlevel="..vim.v.count) end)
vim.keymap.set("n","zh",function () vim.cmd("highlight Folded guibg=bg") end)
vim.keymap.set("n","J","<C-e>")
vim.keymap.set("n","K","<C-y>")
vim.cmd("map <A-j> <C-e>")
vim.cmd("map <A-k> <C-y>")


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
		vim.cmd.wincmd("j")
	end
	vim.cmd.quit()
end)
vim.keymap.set({"n","i","t"},"<A-S-w>",function ()
	local id = vim.fn.win_getid()
	vim.cmd.wincmd("l")
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
		vim.cmd.wincmd(basic_motions[i])
	end)
	local move_win_map = string.format("<leader>ww%s",basic_motions[i])
	vim.keymap.set("n",move_win_map,function()
		vim.cmd.wincmd(string.upper(basic_motions[i]))
	end)
end


-- ++++++++++++ moving code around? visual mode?? ++++++++++++
vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")
