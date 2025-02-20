local fix_quick = function()
    vim.cmd('caddexpr expand("%")..":"..line(".")..":"..getline(".")')
    print("Line added to quickfix list!")
end

vim.api.nvim_create_user_command("FixQuick", fix_quick, {})
vim.keymap.set("n", "]q", function()
    vim.cmd.cnext()
    vim.cmd.normal("zz")
end)
vim.keymap.set("n", "[q", function()
    vim.cmd.cprev()
    vim.cmd.normal("zz")
end)
vim.keymap.set({"n","i"}, "<A-CR>", fix_quick)

-- use :cexpr [] to clear the quickfix list

--- location list
vim.keymap.set("n", "]l", function()
    vim.cmd.lnext()
    vim.cmd.normal("zz")
end)
vim.keymap.set("n", "[l", function()
    vim.cmd.lprev()
    vim.cmd.normal("zz")
end)
