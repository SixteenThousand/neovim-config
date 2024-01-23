local fernOn,_ = pcall(require,"fern")
if fernOn then
	require("nav.manager")
end

require("nav.fuzzy")
require("nav.remaps")
