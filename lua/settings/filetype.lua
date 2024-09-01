local custom = require("settings.custom")

vim.g.python_indent = {
    open_paren = "shiftwidth()",
    continue =  "shiftwidth()",
    closed_paren_align_last_line = false,
}

-- user-defined syntax highlighting
vim.api.nvim_create_autocmd({"BufEnter"}, {
	pattern = {"*.podon"},
	command = "set syntax=podon"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
	pattern = {"*.fruit"},
	command = "set syntax=fruit"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
	pattern = {"*.rasi"},
	command = "set syntax=rasi"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
	pattern = {"*.clifm","clifmrc"},
	command = "set syntax=clifm"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = {".phase"},
    callback = function() vim.bo.filetype = "toml" end,
})

-- HTML/XML-like  languages
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
            "*.json",
        },
		callback = function()
            custom.set_tabwidth(2)
            custom.tag_mode()
		end,
	}
)

-- markdown
vim.api.nvim_create_autocmd(
    {"BufEnter"},
    {
        pattern = {"*.md"},
        callback = function()
            custom.text()
            -- helpful for the one job applications file
            vim.fn.setreg("h",[[0i## ]])
            vim.fn.setreg("l",[[vip:s/^\s\+/ - /
        end,
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

-- filetypes that require tabs instead of spaces
-- or other weird tab options
-- makefile recipes
vim.api.nvim_create_autocmd(
    {"BufEnter"},
    {
        pattern = {"Makefile"},
        callback = function()
            vim.bo.expandtab = false
        end,
    }
)
vim.api.nvim_create_autocmd(
    {"BufEnter"},
    {
        pattern = {"*"},
        callback = function()
            if vim.bo.filetype == "sh" then
                -- use tabs instead of spaces to make writing heredocs 
                -- (<< EOF) easier
                vim.bo.expandtab = false
            elseif vim.bo.filetype == "lisp" then
                custom.set_tabwidth(2)
            end
        end,
    }
)