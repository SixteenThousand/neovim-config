-- ++++++++++++ neovide specific configs ++++++++++++

-- (checking whether we are in neovide or not is checked in init.lua)
function neovide_warning()
	print("Currently in neovide!")
end
-- see remap.lua for more details on <C-_>
vim.keymap.set("n","<C-_>",neovide_warning)
vim.keymap.set("i","<C-_>",neovide_warning)
vim.keymap.set("v","<C-_>",neovide_warning)

local fonts = {
    ["agave"] = "Agave Nerd Font Mono:h12", -- no ligatures
    ["cas-win"] = "Caskaydia Cove Nerd Font Mono:h12", -- ligatures, windows only?
    ["cas-arch"] = "CaskaydiaMono Nerd Font:h12", -- arch, no ligatures?
    ["fant"] = "FantasqueSansM Nerd Font:h14", --ligatures
}
vim.o.guifont = fonts.fant

vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_transparency = 1.0
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_window_blurred = false

vim.api.nvim_create_user_command(
	"Fancy",
	function(opts)
		-- vim.o.guifont = fonts[opts.fargs[1] or "agave"]
        if opts.fargs[1] == "off" then
            vim.g.neovide_transparency = 1.0
            vim.g.neovide_window_blurred = false
        else
            vim.g.neovide_transparency = 0.7
            vim.g.neovide_window_blurred = true
        end
	end,
	{nargs="?"}
)
