vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.go",
    callback = function()
        vim.cmd("!go fmt %")
    end
})
