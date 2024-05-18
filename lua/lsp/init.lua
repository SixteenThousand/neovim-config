local lspconf = require("lspconfig")
require("lsp.keymaps")


lspconf.java_language_server.setup {
	cmd = {"java-language-server.cmd"},
	filetypes = {"java"},
}

lspconf.pylsp.setup{
	settings = {
		pylsp = {
			plugins = {
				autopep8 = {
					enabled = false,
				},
				pycodestyle = {
					enabled = false,
				},
			},
		},
	},
}

lspconf.rust_analyzer.setup{
    cmd = {"rust-analyzer"},
}

lspconf.texlab.setup{}

lspconf.gopls.setup{}

lspconf.cssls.setup{}

lspconf.eslint.setup{}

lspconf.sqls.setup{}

lspconf.tsserver.setup{}
