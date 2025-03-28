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
vim.keymap.set({"n","v"},"<leader>P","\"+P")
	-- these let me copy & paste with the outside world


-- ++++++++++++ suggestions & completion ++++++++++++
vim.keymap.set("i","<C-f>","<C-n>")
vim.keymap.set("i","<C-S-f>","<C-y>")


-- ++++++++++++ sometimes I just can't be bothered to write stuff, y'know? ++++++++++++
local print_statements = {
	["c"] = "printf(",
	["cs"] = "Console.WriteLine(",
	["go"] = "fmt.Println(",
	["haskell"] = "putStrLn ",
	["html"] = "console.log(",
	["java"] = "System.out.println(",
	["javascript"] = "console.log(",
	["javascriptreact"] = "console.log(",
	["lua"] = "print(",
    ["ocaml"] = "Printf.printf ",
	["ps1"] = "echo ",
	["python"] = "print(",
    ["ruby"] = "print ",
	["rust"] = "println!(",
    ["sh"] = "echo -e ",
    ["typescript"] = "console.log(",
    ["typescriptreact"] = "console.log(",
}
vim.keymap.set("i","<C-x><C-p>",function ()
    local print_statement = print_statements[vim.bo.filetype]
    if not print_statement then
        vim.cmd.echoerr("\"No print statement defined for this filetype!\"")
        return
    end
	vim.cmd.normal("i"..print_statement)
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
	vim.go.hlsearch = not vim.go.hlsearch
end)


-- ++++++++++++ changing modes +++++++++++++
vim.keymap.set("t","<C-[>","<C-\\><C-N>")
vim.keymap.set("t","<Esc>","<C-\\><C-N>")
vim.keymap.set("t","<C-PageUp>","<C-\\><C-N><C-PageUp>")
vim.keymap.set("t","<C-PageDown>","<C-\\><C-N><C-PageDown>")
-- save current buffer
vim.keymap.set({"n","i","v"},"<A-s>",function()
    print("Stop trying to use this!")
end)

-- going up & down in insert mode
vim.keymap.set("i","<PageUp>","<Up>")
vim.keymap.set("i","<PageDown>","<Down>")


-- ++++++++++++ folding & scrollling +++++++++++++
vim.cmd("map <C-j> <C-e>")
vim.cmd("map <C-k> <C-y>")
vim.cmd("map <C-h> zh")
vim.cmd("map <C-l> zl")


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
	vim.cmd.resize("+5")
end)
vim.keymap.set("n","<A-_>",function()
	vim.cmd.resize("-5")
end)
-- exiting a buffer/window
vim.keymap.set({"n","i","t"},"<A-w>",function ()
    local id = vim.fn.win_getid()
    vim.cmd.wincmd("j")
    if vim.fn.win_getid() == id then
        vim.cmd.wincmd("l")
    end
    if vim.fn.win_getid() == id then
        vim.cmd.wincmd("k")
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
-- window splits
vim.keymap.set("n","<C-w>v",function()
    vim.cmd.vsplit(vim.fn.expand("%:h"))
end)
vim.keymap.set("n","<C-w>s",function()
    vim.cmd.split(vim.fn.expand("%:h"))
end)


-- ++++++++++++ moving code around? visual mode?? ++++++++++++
vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")


-- ++++++++++++ tabs ++++++++++++
vim.keymap.set({"i","n"},"<A-BS>",function()
    local line = vim.fn.getline(".")
    local startpos = vim.fn.getpos(".")
    if startpos[3] >= #line then
        vim.cmd.normal(string.format("%dXx",vim.bo.tabstop-1))
        vim.fn.cursor(startpos[2],startpos[3]+1)
    else
        vim.cmd.normal(string.format("%dX",vim.bo.tabstop))
    end
end)

-- rename the thing under the cursor
vim.keymap.set("n", "<A-8>", "*:%s/<C-r>///gc<Left><Left><Left>")
vim.keymap.set("n", "<A-7>", "*:%s/<C-r>///g<Left><Left>")

-- turn off/toggle autocomplete
vim.keymap.set({"n","i"}, "<A-f>", function()
    vim.g.minicompletion_disable = not vim.g.minicompletion_disable
end)

-- toggle line numbering
vim.keymap.set({"n","i"}, "<C-#>", function()
    vim.wo.number = not vim.wo.number
    vim.wo.relativenumber = not vim.wo.relativenumber
end)
