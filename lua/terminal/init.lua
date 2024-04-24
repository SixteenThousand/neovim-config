if require("utils").is_windows() then
    require("terminal.pwsh")
end
local repl = require("terminal.repl")
require("terminal.yona")
local term_utils = require("terminal.utils")

-- settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen",{
    callback = function(evt)
        vim.wo.scrolloff = 0
    end,
})
vim.go.shell = "/bin/fish"

-- keymaps
vim.keymap.set("n","<leader>tT",function()
    vim.cmd.edit(string.format("term://%s//1:%s",
        vim.fn.expand("%:h"),
        term_utils.shell
    ))
end)
vim.keymap.set("n","<leader>tt",function()
	local parent = vim.fn.expand("%:h")
	vim.cmd.tabnew()
    vim.cmd.edit(string.format("term://%s//1:%s",
        parent,
        term_utils.shell
    ))
end)
vim.keymap.set("n","<leader>tr",repl.start_repl)
