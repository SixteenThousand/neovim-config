vim.opt.rtp:prepend(vim.fn.stdpath("data").."\\lazy\\lazy.nvim")

require("lazy").setup(
	{
		-- plugins go here
		"rebelot/kanagawa.nvim",
		"marko-cerovac/material.nvim",
		-- "numToStr/Comment.nvim",
	},
	{
		-- lazy configs go here
		change_detection = {
			enabled = true,
			notify = true,
		},
		concurrency = 2,
	}
)
