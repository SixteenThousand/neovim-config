-- ++++++++++++ folding settings ++++++++++++
-- note default foldlevel is set in settings.lua

function MyFoldText()
	return "+--- "..(vim.v.foldend-vim.v.foldstart+1).." lines: "..vim.fn.getline(vim.v.foldstart).." ..."
end

function MyFoldLevel(line_num)
	if vim.fn.getline(line_num) == "" then
		return 0
	else
		return math.floor(
			math.max(vim.fn.indent(line_num),
				vim.fn.indent(line_num-1),
				vim.fn.indent(line_num+1)
			) / vim.o.shiftwidth
		)
	end
end

function MyPyFoldLevel(line_num)
	return math.max(
		vim.fn.indent(line_num),
		vim.fn.indent(line_num+1)
	)
end


vim.o.foldcolumn = "0"
vim.opt.foldtext = "v:lua.MyFoldText()"
vim.cmd.set("fillchars+=fold:\\ ")
vim.cmd.autocmd("FileType * set foldexpr=v:lua.MyFoldLevel(v:lnum)")
vim.cmd.autocmd("FileType py set foldexpr=v:lua.MyPyFoldLevel(v:lnum)")
vim.cmd.autocmd("FileType hs set foldexpr=v:lua.MyPyFoldLevel(v:lnum)")
vim.cmd("highlight Folded guibg=background")

local fold_actions = {
	["show"] = function()
		if vim.o.foldcolumn == "0" then
			vim.o.foldcolumn = "2"
		else
			vim.o.foldcolumn = "0"
		end
	end,
	["off"] = function()
		vim.o.foldmethod = "manual"
		vim.cmd.normal("zE") -- deletes all folds
		vim.o.foldcolumn = "0"
	end,
	["on"] = function()
		vim.o.foldmethod = "expr"
	end,
	["auto"] = function()
		vim.cmd.autocmd("FileType * set foldmethod=expr")
	end,
	["nohl"] = function()
		vim.cmd("highlight Folded guibg=bg")
	end,
}
vim.api.nvim_create_user_command(
	"Fold",
	function(opts)
		fold_actions[opts.fargs[1]]()
	end,
	{nargs=1}
)


-- ++++++++++++ REMAPS ++++++++++++
vim.keymap.set("n","<leader>zl",function() vim.o.foldlevel = vim.v.count end)
vim.keymap.set("n","<leader>zh",fold_actions["nohl"])
