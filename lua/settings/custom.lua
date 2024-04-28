-- ++++++++++++ Custom "Settings" ++++++++++++
-- this module holds functions that change a group of related settings at  
-- once, effectively creating my own custom settings
-- any commands to invoke these "settings" should be in settings/init.lua

local utils = require("utils")
local M = {}


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

function M.set_tabwidth(num)
    vim.bo.tabstop = num
    vim.bo.shiftwidth = num
end

-- tag mode: for files which will use xml-like syntax at any point
function M.tag_mode()
    -- lets % toggle between start & end tags
    vim.b.match_words = "<\\(\\w\\+\\)\\W:<\\/\\1"
    vim.keymap.set(
        "i",
        ">",
        function()
            -- inital state
            local line = vim.fn.getline(".")
            local startpos = vim.fn.getpos(".")
            local line_before_cursor = line:sub(1,startpos[3]-1)
            local line_after_cursor = line:sub(startpos[3])
            -- closing an open tag
            local open_tag = [[^.*<(%S+)[^>]*$]]
            local open_match = line_before_cursor:match(open_tag)
            if open_match ~= nil then
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
                    -- string.rep(" ",indent+vim.o.shiftwidth),
                    -- string.rep(" ",indent)..line_after_cursor,
                    utils.indent_string(startpos[2],1),
                    utils.indent_string(startpos[2],0)..line_after_cursor,
                })
                vim.fn.cursor(startpos[2]+1,1)
                vim.fn.cursor(startpos[2]+1,#vim.fn.getline(".")+20)
                return
            end
            vim.api.nvim_set_current_line(line_before_cursor..">"..line_after_cursor)
            vim.fn.cursor(startpos[2],startpos[3]+1)
        end,
        {buffer = true}
    )
end

return M
