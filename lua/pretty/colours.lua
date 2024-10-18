-- colourscheme management
local COLOUR_SCHEME_FILE = vim.fn.stdpath("config").."/state/colourscheme"

-- default
vim.o.background = "dark"
local csFp = io.open(COLOUR_SCHEME_FILE, "r")
local defaultCs
if csFp then
    defaultCs = csFp:read()
    csFp:close()
else
    defaultCs = "sonokai"
end
local defaultColourSchemeOn, _ = pcall(vim.cmd.colorscheme,defaultCs)
if not defaultColourSchemeOn then
    vim.cmd.colorscheme("zaibatsu")
end

vim.keymap.set("n","<leader>cb",function()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end)

local scopeOn,tlscp = pcall(require,"telescope.builtin")
if scopeOn then
	vim.keymap.set("n","<leader>fc",tlscp.colorscheme)
end

vim.api.nvim_create_autocmd("ColorScheme",{
    callback = function()
        local csFp = io.open(COLOUR_SCHEME_FILE,"w")
        if csFp then
            csFp:write(vim.fn.expand("<amatch>"))
            csFp:close()
        end
    end,
})
