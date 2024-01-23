vim.opt.rtp:prepend(vim.fn.stdpath("data").."/lazy/lazy.nvim")

require("lazy").setup(
	{
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
				vim.g["fern#renderer"] = "nerdfont"
				function fern_remaps()
					vim.g["fern#disable_default_mappings"] = 1

					local opts = {buffer = true}
					-- navigate
					vim.keymap.set("n","o","<Plug>(fern-action-open:system)",opts)
					vim.keymap.set("n","-","<Plug>(fern-action-leave)",opts)
					vim.keymap.set("n","!","<Plug>(fern-action-hidden)",opts)
					vim.keymap.set("n","l","<Plug>(fern-action-expand)",opts)
					vim.keymap.set("n","h","<Plug>(fern-action-collapse)",opts)
					vim.keymap.set("n","<CR>","<Plug>(fern-action-open-or-enter)",opts)
					-- create & delete
					vim.keymap.set("n","N","<Plug>(fern-action-new-file)",opts)
					vim.keymap.set("n","B","<Plug>(fern-action-new-dir)",opts)
					vim.keymap.set("n","D","<Plug>(fern-action-trash)",opts)
					-- cut/copy/paste
					vim.keymap.set({"n","v"},"m","<Plug>(fern-action-mark)",opts)
					vim.keymap.set("n","x","<Plug>(fern-action-clipboard-move)",opts)
					vim.keymap.set("n","c","<Plug>(fern-action-clipboard-copy)",opts)
					vim.keymap.set("n","p","<Plug>(fern-action-clipboard-paste)",opts)
					-- paths
					vim.keymap.set("n","yy","<Plug>(fern-action-yank:path)",opts)
					vim.keymap.set("n","<leader>yy","\"+<Plug>(fern-action-yank:path)",opts)
					-- other
					vim.keymap.set("n","t","<Plug>(fern-action-terminal)",opts)
					vim.keymap.set("n","r","<Plug>(fern-action-rename)",opts)
				end

				vim.cmd.autocmd("FileType fern lua fern_remaps()")
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
		
		-- LSPs & treesitter; filetype-specific
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
		
		
		-- misc.
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
			"numToStr/Comment.nvim",
			lazy = false,
			config = function(plugins,opts)
				require("Comment").setup()
				local commapi = require("Comment.api")
				-- for some reason, "<C-_>" translates to "Ctrl+/"
				vim.keymap.set({"n","i","v"},"<C-_>",commapi.toggle.linewise.current)
			end,
		},
		{
			"ggandor/leap.nvim",
			config = function(plugin,opts)
				require("leap").create_default_mappings()
			end,
		},
	},
	{
		concurrency=1,
		change_detection = {
			enabled = true,
			notify = true,
		},
	}
)
