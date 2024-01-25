-- loose config files
require("colon")
require("remap") -- this has to come before lazy is called
require("settings")
require("syntax")

require("amber")
require("plugins")
require("pretty")
require("terminal")
require("nav")
	-- for some reason this has to go at the end, 
	-- otherwise it breaks the telescope remaps


print("And It Goes On...")
