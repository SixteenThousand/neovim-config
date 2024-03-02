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
					enabled = false,
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

lspconf.gopls.setup{}


-- ++++++++++++ remaps ++++++++++++
vim.api.nvim_create_autocmd("LspAttach",{
    callback = function(evt)
        local client = vim.lsp.get_client_by_id(evt.data.client_id)
        if client.server_capabilities.hoverProvider then
            vim.keymap.set("n","<leader>ii",vim.lsp.buf.hover)
        end
    end,
})
