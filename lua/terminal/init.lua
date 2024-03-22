if require("utils").is_windows() then
    require("terminal.pwsh")
end
require("terminal.repl")
require("terminal.yona")

-- settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen",{
    callback = function(evt)
        vim.wo.scrolloff = 0
    end,
})

-- keymaps
vim.keymap.set("n","<leader>tT",function()
	vim.cmd.edit("term://"..vim.fn.expand("%:h").."//1:pwsh")
end)
vim.keymap.set("n","<leader>tt",function()
	local parent = vim.fn.expand("%:h")
	vim.cmd.tabnew()
	vim.cmd.edit("term://"..parent.."//1:pwsh")
end)
