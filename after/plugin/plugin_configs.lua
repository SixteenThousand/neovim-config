for _, plugin in ipairs(require("plugins.list")) do
    if plugin.config ~= nil then
        plugin.config()
    end
    if plugin.setup ~= nil then
        require(plugin.setup).setup()
    end
end
