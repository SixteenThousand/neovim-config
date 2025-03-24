-- this is my own session manager
local actions = require("amber.actions")

local subcommands = {
    save = actions.save,
    new = actions.save,
    list = actions.list,
    delete = actions.delete,
    wipe = actions.wipe,
    load = actions.load,
    quit = actions.quit,
    manage = actions.manage,
}

vim.api.nvim_create_user_command(
    "Amber",
    function(opts)
        if opts.fargs[1] ~= nil then
            subcommands[opts.fargs[1]](opts.fargs[2])
        else
            print("Amber: command under construction...")
        end
    end,
    {nargs="*"}
)

vim.keymap.set("n", "<A-S-q>", actions.quit)


-- telescope front-end
local utilsOn,popup = pcall(require,"utils.popup")
if utilsOn then
	vim.keymap.set("n","<A-a>",function()
		popup.telescope_dropdown(
			"Amber: Load Session",
			actions.get_amber_files(),
			actions.load
		)
	end)

	vim.keymap.set("n","<A-q>",function()
		popup.telescope_dropdown(
			"Amber: Quit",
			actions.get_amber_files(),
			actions.quit
		)
	end)

	vim.keymap.set("n","<A-S-a>",function()
		popup.telescope_dropdown(
			"Amber: Save Session",
			actions.get_amber_files(),
			actions.save
		)
	end)
end
