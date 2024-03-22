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
