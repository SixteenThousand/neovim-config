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
require("nav")
require("pretty")
-- vim.opt.rtp:prepend("C:/Users/thoma/scoop/apps/neovim/0.9.5/share/nvim-qt")

print("And It Goes On...")
