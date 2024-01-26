-- due to the extensive use of plugins in this file, imports of this file should
-- use the "pluginOn,plugin = pcall(require,plugin)" pattern
local M = {}

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local popup = require "plenary.popup"


-- creates a drop-down list of options that the user can fuzzy-select from, 
-- using the telescope.nvim API
-- title: string; the title that will be shown at the top of the prompt buffer
-- options: list(string); a list of the options to be displayed to the user
-- callback: function(string): the function to be called when the user selects 
-- an option. It should take 1 argument, the option selected.
function M.telescope_dropdown(title,options,callback)
	pickers.new(
		require("telescope.themes").get_dropdown{},
		{
			prompt_title = title,
			finder = finders.new_table({
				results = options
			}),
			sorter = conf.generic_sorter(usr_config),
			attach_mappings = function(prompt_bufnr,map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					callback(action_state.get_selected_entry()[1])
				end)
				return true
			end
		}
	):find()
end

function M.popup_menu(title,options,callback)
	for filename,_ in sessions_dir do
		_,_,sessions[#sessions+1] = filename:find(pattern)
	end
	popup.create(sessions,{
		title = title,
		border = true,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		minwidth = #title + 20,
		callback = action,
	})
	vim.cmd.set("number")
	vim.cmd.set("relativenumber")
end



return M
