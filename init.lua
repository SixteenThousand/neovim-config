-- loose config files
require("colon")
require("remap") -- this has to come before lazy is called
require("settings")
require("format")

-- packages
require("terminal")

-- plugin-dependent packages
local pluginsOn,_ = pcall(require,"plugins")
if pluginsOn then
    require("amber")
    require("lsp")
    require("nav")
    require("pretty")
    require("snippets")
else
    require("nav.remaps")
end


print("And It Goes On...")
