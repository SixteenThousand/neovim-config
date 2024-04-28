local custom = require("settings.custom")

-- user-defined syntax highlighting
vim.api.nvim_create_autocmd({"BufEnter"}, {
	pattern = {"*.podon"},
	command = "set syntax=podon"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
	pattern = {"*.fruit"},
	command = "set syntax=fruit"
})


vim.api.nvim_create_autocmd(
	{"BufEnter"},
	{
        pattern = {
            "*.css",
            "*.html",
            "*.js",
            "*.jsx",
            "*.php",
            "*.svg",
            "*.ts",
            "*.tsx",
            "*.xml",
        },
		callback = function(event)
            custom.set_tabwidth(2)
            custom.tag_mode()
		end,
	}
)

vim.api.nvim_create_autocmd(
    {"BufEnter"},
    {
        pattern = {"*.md"},
        callback = custom.text,
    }
)
vim.api.nvim_create_autocmd(
    {"BufLeave"},
    {
        pattern = {"*.md"},
        callback = function()
            custom.notext()
        end,
    }
)
