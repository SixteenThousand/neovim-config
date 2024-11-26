-- telescope.nvim configuration
local tlscp = require("telescope.builtin")
local popup = require("utils.popup")
local utils = require("utils")

vim.keymap.set("n","<leader>ff",function ()
    local search_dir = "~/Documents"
    if vim.bo.ft == "fern" then
        search_dir = utils.get_fern_path()
    else
        search_dir = utils.get_project_dir()
    end
	tlscp.find_files({
		no_ignore = true,
		search_dirs = { search_dir },
        previewer = false,
	})
end)
vim.keymap.set("n","<leader>fg",function ()
	local scopeRan,_ = pcall(tlscp.git_files,{
		no_ignore = true,
        use_file_path = true,
        previewer = false,
	})
    if not scopeRan then
        vim.cmd.echohl("WarningMsg")
        vim.cmd.echo("\"Not in a git repo (sorry)\"")
        vim.cmd.echohl("None")
    end
end)
vim.keymap.set("n","<leader>fb",function()
    tlscp.buffers({previewer = false})
end)
vim.keymap.set("n","<leader>fh",function()
    tlscp.help_tags({previewer = true})
end)
vim.keymap.set("n","<leader>fj",function()
    tlscp.jumplist({previewer = false})
end)

local move_to_dirs = {}
function move_to()
    local HOME = os.getenv("HOME")
    if #move_to_dirs == 0 then
        print("Move TO!: finding directories...")
        local get_dirs_cmd
        local MAXDEPTH = "5"
        if utils.is_windows() then
            get_dirs_cmd = table.concat(
                {
                    "pwsh -c",
                    "\"Get-ChildItem",
                    HOME,
                    "-Directory -Recurse -Depth",
                    MAXDEPTH,
                    "| Select-Object -ExpandProperty FullName\"",
                },
                " "
            )
        else
            get_dirs_cmd = table.concat(
                {
                    "find",
                    HOME,
                    "-maxdepth",
                    MAXDEPTH,
                    "-type d",
                    "2>/dev/null",
                },
                " "
            )
        end
        local shell_output = io.popen(get_dirs_cmd,"r")
        while true do
            local line = shell_output:read()
            if line == nil then
                break
            else
                move_to_dirs[#move_to_dirs+1] = line:sub(#HOME+2)
            end
        end
        shell_output:close()
    end
	popup.telescope_dropdown(
		"Move To!",
		move_to_dirs,
		function(path)
			vim.cmd.edit(HOME.."/"..path)
		end
	)
end
vim.keymap.set("n","<leader>ed",move_to)
