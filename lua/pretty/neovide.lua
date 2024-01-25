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


vim.o.guifont = "Agave Nerd Font Mono:h12" -- no ligatures
-- vim.o.guifont = "CaskaydiaCove Nerd Font:h11" -- ligatures
-- vim.o.guifont = "FantasqueSansM Nerd Font:h12" --ligatures
vim.api.nvim_create_user_command(
	"Fancy",
	function()
		vim.o.guifont = "FantasqueSansM Nerd Font:h12"
	end,
	{}
)
vim.api.nvim_create_user_command(
	"NoFancy",
	function()
		vim.o.guifont = "Agave Nerd Font Mono:h12"
	end,
	{}
)
vim.g.neovide_cursor_vfx_mode = "none"
-- vim.g.neovide_transparency = 0.8
-- vim.g.neovide_hide_mouse_when_typing = true
