-- recording the current state so default settings can shared across instances
local COLOUR_SCHEME_FILE = vim.fn.stdpath("config").."/state/colourscheme"
local OPACITY_FILE = vim.fn.stdpath("config").."/state/opacity"
vim.api.nvim_create_autocmd("ColorScheme",{
    callback = function()
        local csFp = io.open(COLOUR_SCHEME_FILE,"w")
        if csFp then
            csFp:write(vim.fn.expand("<amatch>"))
            csFp:close()
        end
    end,
})


-- dark/light mode
vim.o.background = "dark"
vim.keymap.set("n","<leader>cb",function()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end)

-- colourscheme
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
-- change colourscheme
local scopeOn,tlscp = pcall(require,"telescope.builtin")
if scopeOn then
	vim.keymap.set("n","<leader>fc",tlscp.colorscheme)
end

-- opacity
function set_opacity(use_transparency)
    if vim.g.neovide then
        if use_transparency then
            vim.g.neovide_transparency = 0.9
       else
            vim.g.neovide_transparency = 1.0
        end
        return
    end
    if vim.g.colors_name == "everforest" then
        vim.g.everforest_transparent_background = use_transparency
    elseif vim.g.colors_name == "sonokai" then
        vim.g.sonokai_transparent_background = use_transparency
    elseif vim.g.colors_name:match("^kanagawa") then
        require("kanagawa").setup({
            transparent = use_transparency
        })
    elseif vim.g.colors_name:match("^catppuccin") then
        require("catppuccin").setup({
            transparent_background = use_transparency
        })
    elseif vim.g.colors_name:match("^material") then
        require("material").setup({
            disable = {
                background = not use_transparency
            }
        })
    elseif vim.g.colors_name:match("fox$") then
        require("nightfox").setup({
            options = {
                transparent = use_transparency
            }
        })
    end
    vim.cmd.colorscheme(vim.g.colors_name)
end
local opacityFp = io.open(OPACITY_FILE,"r")
if opacityFp then
    set_opacity(opacityFp:read() == "1")
    opacityFp:close()
end
vim.keymap.set("n","<leader>co",function()
    local opacityFp = io.open(OPACITY_FILE,"r")
    if opacityFp then
        local use_transparency = opacityFp:read() ~= "1"
        opacityFp:close()
        opacityFp = io.open(OPACITY_FILE,"w")
        if opacityFp then
            if use_transparency then
                opacityFp:write("1")
            else
                opacityFp:write("0")
            end
            opacityFp:close()
        end
        set_opacity(use_transparency)
    else
        print("No opacity state file found!")
    end
end)
