-- loose config files
require("colon")
require("remap")
require("settings")

-- packages
require("terminal")

-- plugin-dependent packages
local pluginsOn,_ = pcall(require,"plugins")
if pluginsOn then
    require("amber")
    if vim.g.sixteen_lsp then
        require("lsp")
    end
    require("nav")
    require("pretty")
    require("snippets")
else
    require("nav.remaps")
end


print("And It Goes On...")
