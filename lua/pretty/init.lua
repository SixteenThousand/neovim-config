require("pretty.colours")
if vim.g.neovide then
	require("pretty.neovide")
else
	local guiOn,_ = pcall(vim.cmd.GuiRenderLigatures,true)
    if guiOn then
        vim.cmd("GuiWindowOpacity 0.85")
        vim.g.GuiMouseHide = 1
        vim.cmd.call("GuiWindowFullScreen(1)")
        -- vim.cmd.call("GuiWindowFrameless(1)")
        vim.g.guifont = "FantasqueSansM Nerd Font Mono:h9"
    end
end
