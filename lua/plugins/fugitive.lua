-- vim-fugitive config

-- status
vim.keymap.set("n","<leader>gg",":Git ")
vim.keymap.set("n","<leader>gs",function () vim.cmd("Git status") end)

-- staging
vim.keymap.set("n","<leader>ge",function ()
    vim.cmd("Git add -A")
    print("All Changes Staged! Proceed to commit!")
end)
vim.keymap.set("n","<leader>ga",function ()
    vim.cmd("Git add "..vim.fn.expand("%:p"))
    print("This buffer has been staged!")
end)

-- committing (also see :Diff command)
vim.keymap.set("n","<leader>gc",function ()
    vim.cmd.Git("commit")
    vim.cmd.startinsert()
end)
vim.keymap.set("n","<leader>gf",":Git commit -F ")

-- branching
vim.keymap.set("n","<leader>gb",":Git branch ")
vim.keymap.set("n","<leader>gm",":Git merge ")

-- git diffing
vim.keymap.set("n","<leader>gd",":Git diff ")
vim.api.nvim_create_user_command(
    "Diff",
    function(opts)
        vim.cmd("tab split")
        local start_loc = vim.fn.win_getid()
        vim.cmd("Git diff "..(opts.fargs[1] or ""))
        vim.fn.win_gotoid(start_loc)
        vim.cmd("Git")
        local gitwin_loc = vim.fn.win_getid()
        vim.cmd.wincmd("H")
        vim.fn.win_gotoid(start_loc)
        vim.cmd.quit()
        vim.fn.win_gotoid(gitwin_loc)
    end,
    {nargs="?"}
)

-- logging
vim.keymap.set("n","<leader>gl",":Git log ")
