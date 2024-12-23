local lspconf = require("lspconfig")
require("lsp.keymaps")


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
lspconf.pyright.setup{}

lspconf.rust_analyzer.setup{
    cmd = {"rust-analyzer"},
}

lspconf.texlab.setup{}
lspconf.gopls.setup{}
lspconf.cssls.setup{}
lspconf.sqls.setup{}
lspconf.ts_ls.setup{}
lspconf.clangd.setup{}
lspconf.jdtls.setup{}
lspconf.csharp_ls.setup{}
