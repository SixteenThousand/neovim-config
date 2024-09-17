local custom = require("settings.custom")

vim.g.python_indent = {
    open_paren = "shiftwidth()",
    continue =  "shiftwidth()",
    closed_paren_align_last_line = false,
}

-- user-defined syntax highlighting
vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = {"*.podon"},
    command = "set filetype=podon"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = {"*.fruit"},
    command = "set filetype=fruit"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = {"*.rasi"},
    command = "set filetype=rasi"
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
            vim.fn.setreg("l",[[vip:s/^\s\+/ - /]])
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
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern = "lisp",
        callback = function()
            custom.set_tabwidth(2)
        end,
    }
)

-- tabs vs spaces settings
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern = "*",
        callback = function()
            if vim.bo.filetype ~= "make" and vim.bo.filetype ~= "sh" then
                vim.bo.expandtab = true
            end
        end,
    }
)
