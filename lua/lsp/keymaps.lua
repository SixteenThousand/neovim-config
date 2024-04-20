-- ++++++++++++ keymaps ++++++++++++

-- get information/hover
vim.api.nvim_create_autocmd("LspAttach",{
    callback = function(evt)
        local client = vim.lsp.get_client_by_id(evt.data.client_id)
        if client.server_capabilities.hoverProvider then
            vim.keymap.set("n","<leader>ii",vim.lsp.buf.hover)
        else
            vim.keymap.set("n","<leader>ii",function()
                print("Sorry, this LSP doesn't support hover!")
            end)
        end
    end,
})

-- goto warnings/errors
vim.keymap.set("n","]e",function()
    vim.diagnostic.goto_next({
        severity = vim.diagnostic.severity.ERROR
    })
end)
vim.keymap.set("n","[e",function()
    vim.diagnostic.goto_prev({
        severity = vim.diagnostic.severity.ERROR
    })
end)
vim.keymap.set("n","]w",function()
    vim.diagnostic.goto_next({
        severity = vim.diagnostic.severity.WARNING
    })
end)
vim.keymap.set("n","[w",function()
    vim.diagnostic.goto_prev({
        severity = vim.diagnostic.severity.WARNING
    })
end)
