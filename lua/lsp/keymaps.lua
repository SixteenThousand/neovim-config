-- ++++++++++++ keymaps ++++++++++++

-- get information/hover
vim.api.nvim_create_autocmd("LspAttach",{
    callback = function(evt)
        local client = vim.lsp.get_client_by_id(evt.data.client_id)
        if client.server_capabilities.hoverProvider then
            vim.keymap.set("n","<F1>",vim.lsp.buf.hover)
        else
            vim.keymap.set("n","<F1>",function()
                print("Sorry, this LSP doesn't support hover!")
            end)
        end
        vim.keymap.set("n","gd",vim.lsp.buf.definition,{buffer=true})
        vim.keymap.set({"n","i"},"<F2>",vim.lsp.buf.rename,{buffer=true})
        vim.opt_global.completeopt:remove("preview")
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
