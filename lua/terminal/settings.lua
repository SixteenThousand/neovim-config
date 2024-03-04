-- settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen",{
    callback = function(evt)
        vim.wo.scrolloff = 0
        vim.fn.setreg("z","katara")
    end,
})
