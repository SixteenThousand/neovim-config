require("pretty.colours")
if vim.g.neovide then
	require("pretty.neovide")
else
	vim.cmd.GuiRenderLigatures(true)
	vim.cmd("GuiWindowOpacity 0.85")
	vim.g.GuiMouseHide = 1
	vim.cmd.call("GuiWindowFullScreen(1)")
	-- vim.cmd.call("GuiWindowFrameless(1)")
	vim.o.guifont = "FantasqueSansM Nerd Font Mono:h9"
end
