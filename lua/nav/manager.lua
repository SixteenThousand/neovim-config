function fern_remaps()
	vim.g["fern#disable_default_mappings"] = 1

	local opts = {buffer = true}
	-- navigate
	vim.keymap.set("n","o","<Plug>(fern-action-open:system)",opts)
	vim.keymap.set("n","-","<Plug>(fern-action-leave)",opts)
	vim.keymap.set("n","!","<Plug>(fern-action-hidden)",opts)
	vim.keymap.set("n","l","<Plug>(fern-action-expand)",opts)
	vim.keymap.set("n","h","<Plug>(fern-action-collapse)",opts)
	vim.keymap.set("n","<CR>","<Plug>(fern-action-open-or-enter)",opts)
	-- create & delete
	vim.keymap.set("n","N","<Plug>(fern-action-new-file)",opts)
	vim.keymap.set("n","B","<Plug>(fern-action-new-dir)",opts)
	vim.keymap.set("n","D","<Plug>(fern-action-trash)",opts)
	-- cut/copy/paste
	vim.keymap.set({"n","v"},"m","<Plug>(fern-action-mark)",opts)
	vim.keymap.set("n","x","<Plug>(fern-action-clipboard-move)",opts)
	vim.keymap.set("n","c","<Plug>(fern-action-clipboard-copy)",opts)
	vim.keymap.set("n","p","<Plug>(fern-action-clipboard-paste)",opts)
	-- paths
	vim.keymap.set("n","yy","<Plug>(fern-action-yank:path)",opts)
	vim.keymap.set("n","<leader>yy","\"+<Plug>(fern-action-yank:path)",opts)
	-- other
	vim.keymap.set("n","t","<Plug>(fern-action-terminal)",opts)
	vim.keymap.set("n","r","<Plug>(fern-action-rename)",opts)
end

vim.cmd.autocmd("FileType fern lua fern_remaps()")

vim.cmd("let g:fern#default_hidden=1")
