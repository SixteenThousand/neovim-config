-- ++++++++++++ Custom "Settings" ++++++++++++
-- this module holds functions that change a group of related settings at  
-- once, effectively creating my own custom settings
-- any commands to invoke these "settings" should be in settings/init.lua

local utils = require("utils")
local M = {}

function M.sixteen_defaults()
    -- line numbers
    vim.o.number = true
    vim.o.relativenumber = true
    vim.cmd.set("formatoptions-=r formatoptions-=o formatoptions-=l")
        -- stops vim from auto-inserting a bunch of comments
    vim.o.textwidth = 76
    vim.o.wrap = false
end
function M.collab_mode()
    vim.o.number = true
    vim.o.relativenumber = false
    vim.bo.expandtab = true
    vim.cmd.set("formatoptions-=r formatoptions-=o formatoptions-=l")
        -- stops vim from auto-inserting a bunch of comments
    vim.o.textwidth = 76
    vim.o.foldlevel = 0
    vim.o.wrap = true
    if vim.g.neovide then
        vim.g.neovide_transparency = 0.9
    end
end


-- enter "Text mode"; enable a bunch of options that make writing long blocks of
-- text much easier
function M.text()
    vim.opt.formatoptions:append("taw")
    vim.wo.spell = true
end
function M.notext()
    vim.opt.formatoptions:remove("t")
    vim.opt.formatoptions:remove("a")
    vim.opt.formatoptions:remove("w")
    vim.wo.spell = false
end

-- actually set the tab width
function M.set_tabwidth(num)
    vim.bo.tabstop = num
    vim.bo.shiftwidth = num
end

-- tag mode: for files which will use xml-like syntax at any point
function M.tag_mode()
    -- lets % toggle between start & end tags
    vim.b.match_words = [[<\(\w\+\)\W:<\/\1]]
    vim.keymap.set(
        "i",
        ">",
        function()
            -- inital state
            local line = vim.fn.getline(".")
            local startpos = vim.fn.getpos(".")
            local line_before_cursor = line:sub(1,startpos[3]-1)
            local line_after_cursor = line:sub(startpos[3])
            -- see if we're at an open tag
            local open_tag = [[^.*<([^/!%s][^>%s]*)[^>]*$]]
            local open_match = line_before_cursor:match(open_tag)
            if open_match ~= nil then
                -- check that we're actually closing a legit HTML tag
                local last_char = line_before_cursor:sub(-1)
                local bad_last_chars = {
                    "/", -- becuase self-closing tags
                    "=", -- becuase react event handlers
                    "?", -- becuase PHP
                }
                for _,char in pairs(bad_last_chars) do
                    if last_char == char then
                        vim.api.nvim_set_current_line(
                            line_before_cursor..">"..line_after_cursor)
                        vim.fn.cursor(startpos[2],startpos[3]+1)
                        return
                    end
                end
                -- close the tag
                vim.api.nvim_set_current_line(string.format(
                    "%s></%s>%s",
                    line_before_cursor,
                    open_match,
                    line_after_cursor
                ))
                vim.fn.cursor(startpos[2],startpos[3]+1)
                return
            end
            -- putting the end tag on a new line
            local close_tag_before = [[<(%S+)[^>]*>$]]
            local close_tag_after = [[^</([^%s>]+)>]]
            local match_before = line_before_cursor:match(close_tag_before)
            local match_after = line_after_cursor:match(close_tag_after)
            if match_before ~= nil and match_before == match_after then
                vim.api.nvim_set_current_line(line_before_cursor)
                vim.fn.append(startpos[2],{
                    utils.indent_string(startpos[2],1),
                    utils.indent_string(startpos[2],0)..line_after_cursor,
                })
                vim.fn.cursor(startpos[2]+1,1)
                vim.fn.cursor(startpos[2]+1,#vim.fn.getline(".")+20)
                return
            end
            vim.api.nvim_set_current_line(
                line_before_cursor..">"..line_after_cursor)
            vim.fn.cursor(startpos[2],startpos[3]+1)
        end,
        {buffer = true}
    )
    vim.keymap.set("i","<C-.>",
        function()
            local startpos = vim.fn.getpos(".")
            vim.api.nvim_set_current_line(
                line_before_cursor..">"..line_after_cursor)
            vim.fn.cursor(startpos[2],startpos[3]+1)
        end,
        {buffer = true}
    )
end

-- ++++++++++++ folding settings ++++++++++++
function sixteen_fold_text()
	return "+--- "..(vim.v.foldend-vim.v.foldstart+1).." lines: "..vim.fn.getline(vim.v.foldstart).." ..."
end

function py_indent_foldlevel(line_num, maxlevel)
    if vim.fn.getline(line_num) == "" then
        return 0
    end
    local level = math.max(vim.fn.indent(line_num), vim.fn.indent(line_num+1))
        / vim.bo.shiftwidth
    return math.min(level, maxlevel)
end
        
vim.o.foldcolumn = "0"
vim.go.foldtext = "v:lua.sixteen_fold_text()"
vim.cmd.set("fillchars+=fold:\\ ")

M.fold_actions = {
    ["show"] = function()
        if vim.o.foldcolumn == "0" then
            vim.o.foldcolumn = "2"
        else
            vim.o.foldcolumn = "0"
        end
    end,
    ["wipe"] = function()
        vim.o.foldmethod = "manual"
        vim.cmd.normal("zE") -- deletes all folds
        vim.o.foldcolumn = "0"
    end,
    -- python-style indentation folding
    ["py"] = function()
        vim.o.foldexpr = "v:lua.py_indent_foldlevel(v:lnum,99)"
        vim.o.foldmethod = "expr"
        vim.o.foldcolumn = "2"
    end,
    ["max1"] = function()
        vim.o.foldexpr = "v:lua.py_indent_foldlevel(v:lnum,1)"
        vim.o.foldmethod = "expr"
        vim.o.foldcolumn = "2"
    end,
    -- c-style marker folding
    ["c"] = function()
        vim.o.foldmethod = "marker"
        vim.o.foldmarker = "{,}"
        vim.o.foldcolumn = "2"
    end,
}

-- stop folds being highlighted
vim.cmd("highlight Folded guibg=bg")
vim.api.nvim_create_autocmd("ColorScheme",{
    callback = function()
		vim.cmd("highlight Folded guibg=bg")
    end,
})


return M
