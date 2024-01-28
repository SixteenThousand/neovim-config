return {
	-- colourschemes & appearance
	"rebelot/kanagawa.nvim",
	"sainnhe/everforest",
	"marko-cerovac/material.nvim",
	"sainnhe/sonokai",
	"rose-pine/neovim",
	"ku-s-h/summerfruit256.vim",
	"shaunsingh/nord.nvim",
	"xero/miasma.nvim",
	"folke/tokyonight.nvim",
	
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
		    options = {
				-- note lualine is also mentioned in the <A-r> remap in 
				-- remap.lua
				-- 
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' }
		    },
			sections = {
				lualine_x = {"encoding","fileformat","filesize","filetype"},
				lualine_y = {"progress"},
				lualine_z = {"location"}
			}
		},
	},
	"equalsraf/neovim-gui-shim",
	
	
	-- find things! maybe explore some files!!
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case"
			}
		},
	},
	{
		"lambdalisue/fern.vim",
		config = function(plugin)
			-- vimscript plugins don't need to be explicity sourced!
			vim.g["fern#renderer"] = "nerdfont"
			require("nav.manager")
		end,
	},
	{
		"lambdalisue/fern-renderer-nerdfont.vim",
		dependencies = {
			"lambdalisue/nerdfont.vim",
			"lambdalisue/fern.vim",
		},
	},
	{
		"lambdalisue/fern-hijack.vim",
		dependencies = {
			"lambdalisue/fern.vim",
		},
	},
	
	-- LSPs, treesitter, & filetype-specific stuff
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"alvan/vim-closetag",
		config = function(plugin,opts)
			vim.g.closetag_filenames = "*.html,*.xml,*.svg,*.js"
			vim.g.closetag_filetypes = "html,xml,svg"
			vim.g.closetag_emptyTags_caseSensitive = 1
			vim.g.closetag_shortcut = ">"
			vim.g.closetag_close_shortcut = "<C-A-F1>"
			-- this one is designed to never be used
		end,
	},
	{
		"lervag/vimtex",
		config = function(plugin,opts)
			vim.cmd("filetype plugin on")
		end,
	},
	"maxmellon/vim-jsx-pretty",
	"neovim/nvim-lspconfig",
	
	
	-- git
	{
		"tpope/vim-fugitive",
		lazy = false,
		config = function(plugins,opts)
			vim.keymap.set("n","<leader>gg",":Git ")
			vim.keymap.set("n","<leader>gs",function () vim.cmd("Git status") end)
			vim.keymap.set("n","<leader>ge",function ()
				vim.cmd("Git add -A")
				print("All Changes Staged! Proceed to commit!")
			end)
			vim.keymap.set("n","<leader>ga",function ()
				vim.cmd("Git add "..vim.fn.expand("%:p"))
				print("This buffer has been staged!")
			end)
			vim.keymap.set("n","<leader>gc",function ()
				vim.cmd.Git("commit")
				vim.cmd.startinsert()
			end)
			vim.keymap.set("n","<leader>gy",function ()
				vim.cmd("Yona commit")
			end)
			vim.keymap.set("n","<leader>gf",":Git commit -F ")
			vim.keymap.set("n","<leader>gb",":Git branch ")
			vim.keymap.set("n","<leader>gd",function ()
				vim.cmd("Git diff")
			end)
		end,
	},
	
	
	{
		"ggandor/leap.nvim",
		config = function(plugin,opts)
			require("leap").create_default_mappings()
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function(plugins,opts)
			require("Comment").setup()
			local commapi = require("Comment.api")
			-- for some reason, "<C-_>" translates to "Ctrl+/"
			vim.keymap.set({"n","i","v"},"<C-_>",commapi.toggle.linewise.current)
			vim.keymap.set({"n","i","v"},"<C-/>",commapi.toggle.linewise.current)
		end,
	},
}
