-- colourscheme management

-- default
-- vim.cmd.colorscheme("slate")
vim.cmd.colorscheme("kanagawa")

local scopeOn,tlscp = pcall(require,"telescope.builtin")
if scopeOn then
	vim.keymap.set("n","<leader>fc",tlscp.colorscheme)
end
