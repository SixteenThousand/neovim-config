-- this is my own session manager
local actions = require("amber.actions")

local subcommands = {
    save = actions.amber_save,
    new = actions.amber_save,
    list = actions.amber_list,
    delete = actions.amber_delete,
    wipe = actions.amber_wipe,
    load = actions.amber_load,
    quit = actions.amber_quit,
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


-- telescope front-end
local utilsOn,popup = pcall(require,"utils.popup")
if utilsOn then
	vim.keymap.set("n","<A-a>",function()
		popup.telescope_dropdown(
			"Amber: Load Session",
			actions.get_amber_files(),
			actions.amber_load
		)
	end)

	vim.keymap.set("n","<A-q>",function()
		popup.telescope_dropdown(
			"Amber: Quit",
			actions.get_amber_files(),
			actions.amber_quit
		)
	end)

	vim.keymap.set("n","<A-S-a>",function()
		popup.telescope_dropdown(
			"Amber: Save Session",
			actions.get_amber_files(),
			actions.amber_save
		)
	end)
end
