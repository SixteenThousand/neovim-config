local fuzzyOn,fuzzy = pcall(require,"nav.fuzzy")
require("nav.remaps")
require("nav.quickfix")
-- nav.manager is sourced from the relevant file manager`s config

-- opens a view on some given buffer(specified as with :buffer) and deletes the 
-- current buffer afterwards ("salting the earth" in its wake)
vim.api.nvim_create_user_command(
    "Salt",
    function(opts)
        -- find out where we are
        local here = vim.fn.bufnr()
        -- find out where we're going & go there
        -- default case
        if opts.fargs[1] == nil then
            vim.cmd.edit(vim.fn.expand("%:h"))
        else
            vim.cmd.buffer(opts.fargs[1])
        end
        -- get rid of original buffer
        vim.cmd.bdelete(here)
    end,
    {nargs="?"}
)
