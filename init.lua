-- loose config files
require("colon")
require("remap") -- this has to come before lazy is called
require("settings")
require("syntax")

-- packages
require("terminal")

-- plugin-dependent packages
require("plugins")

require("amber")
require("lsp")
require("nav")
require("pretty")


print("And It Goes On...")
