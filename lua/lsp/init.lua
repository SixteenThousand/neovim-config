local lspconf = require("lspconfig")
require("lsp.keymaps")


lspconf.pyright.setup{}
lspconf.rust_analyzer.setup{
    cmd = {"rust-analyzer"},
}
lspconf.gopls.setup{}
lspconf.ts_ls.setup{}
lspconf.clangd.setup{}
