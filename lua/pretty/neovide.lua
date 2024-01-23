-- ++++++++++++ neovide specific configs ++++++++++++

-- (checking whether we are in neovide or not is checked in init.lua)
function neovide_warning()
	print("Currently in neovide!")
end
-- see remap.lua for more details on <C-_>
vim.keymap.set("n","<C-_>",neovide_warning)
vim.keymap.set("i","<C-_>",neovide_warning)
vim.keymap.set("v","<C-_>",neovide_warning)

local commOn,commapi = pcall(require,"Comment.api")
if commOn then
	vim.keymap.set("n","<C-/>",commapi.toggle.linewise.current)
	vim.keymap.set("i","<C-/>",commapi.toggle.linewise.current)
	vim.keymap.set("v","<C-/>",commapi.toggle.linewise.current)
end


vim.o.guifont = "Agave Nerd Font Mono:h12"

vim.g.neovide_transparency = 0.8
