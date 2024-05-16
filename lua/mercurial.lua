-- trying to recreate vim-fugitive myself

vim.api.nvim_create_user_command(
    "Hg",
    function(opts)
        vim.cmd("!cd %:h && hg "..(opts.fargs[1] or ""))
    end,
    {nargs="?"}
)
