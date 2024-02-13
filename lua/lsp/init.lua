local lspconf = require("lspconfig")


lspconf.java_language_server.setup {
	cmd = {"java-language-server.cmd"},
	filetypes = {"java"},
}

lspconf.pylsp.setup{
	settings = {
		pylsp = {
			plugins = {
				autopep8 = {
					enabled = true,
				},
				pycodestyle = {
					enabled = false,
				},
			},
		},
	},
}

lspconf.rust_analyzer.setup{}

lspconf.texlab.setup{}
