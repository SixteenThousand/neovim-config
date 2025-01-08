vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = "*",
        callback = function()
            if vim.fn.getline(1):find("#!.*sbcl %-%-script") == 1 then
                vim.bo.filetype = "lisp"
            end
        end,
    }
)
