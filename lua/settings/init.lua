require("settings.builtin")
local custom = require("settings.custom")


-- spellcheck
vim.api.nvim_create_user_command(
	"Spell",
    function()
        vim.wo.spell = true
    end,
	{}
)
vim.api.nvim_create_user_command(
	"NoSpell",
	function ()
        vim.wo.spell = false
	end,
	{}
)

vim.api.nvim_create_user_command(
	"Text",
    custom.text,
	{}
)
vim.api.nvim_create_user_command(
	"NoText",
    custom.notext,
	{}
)

-- changes tab size
vim.api.nvim_create_user_command(
    "SetTabWidth",
    function(opts)
        custom.set_tabwidth(tonumber(opts.fargs[1]))
    end,
    {nargs = 1}
)

-- folding
vim.keymap.set("n","<leader>zl",function() vim.o.foldlevel = vim.v.count end)
vim.keymap.set("n","<leader>zh",custom.fold_actions["nohl"])
vim.api.nvim_create_user_command(
	"Fold",
	function(opts)
		custom.fold_actions[opts.fargs[1]]()
	end,
	{nargs=1}
)

-- filetype-specific
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
            -- "*.js",
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
