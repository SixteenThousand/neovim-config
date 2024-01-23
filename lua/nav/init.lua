local status,_ = pcall(require,"fern")
if status then
	require("nav.manager")
end

require("nav.remaps")
