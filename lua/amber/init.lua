-- this is my own session manager
local actions = require("amber.actions")

vim.api.nvim_create_user_command(
	"AmberQuit",
	function(opts)
		actions.amber_quit(opts.fargs[1])
	end,
	{nargs=1}
)

vim.api.nvim_create_user_command(
	"AmberSave",
	function(opts)
		actions.amber_save(opts.fargs[1])
		print("Session <<"..opts.fargs[1]..">> saved!")
	end,
	{nargs=1}
)

vim.api.nvim_create_user_command(
	"AmberList",
	function(opts)
		actions.amber_list()
	end,
	{nargs=0}
)

vim.api.nvim_create_user_command(
	"AmberLoad",
	function(opts)
		actions.amber_load(opts.fargs[1])
	end,
	{nargs=1}
)

vim.api.nvim_create_user_command(
	"AmberWipe",
	function(opts)
		actions.amber_wipe(opts.fargs[1])
		print("Session <<"..opts.fargs[1]..">> has been wiped!")
	end,
	{nargs=1}
)

vim.api.nvim_create_user_command(
	"AmberDelete",
	function(opts)
		actions.amber_delete(opts.fargs[1])
		print("Session <<"..opts.fargs[1]..">> has been deleted entirely!")
	end,
	{nargs=1}
)


-- telescope front-end
local utilsOn,popup = pcall(require,"popup")
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

