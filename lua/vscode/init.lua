print("Hello, VSCode!")

-- vim.keymap.set("n","<A-t>",":!ls")
require("utils").write_log({ msg = "We got in to VSCode!" })
vim.cmd("map <C-S-t> :!ls<CR>")
