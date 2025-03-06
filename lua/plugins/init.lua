local plugin_list = require("plugins.list")

-- set loading order
local dirs = {}
for _, plugin in ipairs(plugin_list) do
    local dirname = (type(plugin) == "string" and plugin) or plugin.dirname
    dirs[#dirs+1] = vim.fn.stdpath("data").."/sixteen-plugins/"..dirname
end
vim.opt_global.runtimepath:prepend(dirs)
