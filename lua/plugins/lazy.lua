vim.opt.rtp:prepend(vim.fn.stdpath("data").."\\lazy\\lazy.nvim")

require("lazy").setup(
	"plugins.list",
	{
		change_detection = {
			enabled = true,
			notify = true,
		},
		concurrency = 2
	}
)
