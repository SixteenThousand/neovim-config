CONF_DIR=$(HOME)/.config/nvim
PLUGIN_DIR=$(HOME)/.local/share/nvim
PLUGINS=\
		https://github.com/numToStr/Comment.nvim.git \
		https://github.com/L3MON4D3/LuaSnip.git \
		https://github.com/sainnhe/everforest.git \
		https://github.com/nvim-lualine/lualine.nvim.git \
		https://github.com/tadmccorkle/markdown.nvim.git \
		https://github.com/EdenEast/nightfox.nvim.git \
		https://github.com/neovim/nvim-lspconfig.git \
		https://github.com/nvim-treesitter/nvim-treesitter.git \
		https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git \
		https://github.com/nvim-tree/nvim-web-devicons.git \
		https://github.com/nvim-lua/plenary.nvim.git \
		https://github.com/ku-s-h/summerfruit256.vim.git \
		https://github.com/nvim-telescope/telescope.nvim.git \
		https://github.com/tpope/vim-fugitive.git \
		https://github.com/tpope/vim-surround.git


install:
	ln -s $(PWD) $(CONF_DIR)
	mkdir -p ./state
uninstall:
	rm $(CONF_DIR)

plugins:
	git clone https://github.com/catppuccin/nvim.git $(PLUGIN_DIR)/catppuccin
	cd $(PLUGIN_DIR) && \
		for plugin in $(PLUGINS); do; git clone --depth=1 $$plugin; done
