-- run the command below with {LAZYPATH} replaced by the path put into prepend 
-- below to install Lazy
-- git clone --filter=blob:none https://github.com/folke/lazy.nvim.git \
-- --branch=stable {LAZYPATH}
vim.opt.rtp:prepend(vim.fn.stdpath("data").."/lazy/lazy.nvim")

require("lazy").setup(
	"plugins.list",
	{
		change_detection = {
			enabled = true,
			notify = true,
		},
		concurrency = 2,
		lazy = false,
	}
)
