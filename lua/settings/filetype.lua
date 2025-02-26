local custom = require("settings.custom")

-- HTML/XML-like  languages
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = {
            "*.css",
            "*.html",
            "*.js",
            "*.cjs",
            "*.mjs",
            "*.jsx",
            "*.vue",
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

-- markdown; the 'spell' option is annoying
vim.api.nvim_create_autocmd(
    {"BufEnter"},
    {
        pattern = {"*.md"},
        callback = function()
            custom.text()
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
vim.g.markdown_fenced_languages = {
    "sh",
    "bash=sh",
}

-- lisp stuff
vim.g.lisp_rainbow = 1
