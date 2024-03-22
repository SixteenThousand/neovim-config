-- ++++++++++++ Custom "Settings" ++++++++++++
-- this module holds functions that change a group of related settings at  
-- once, effectively creating my own custom settings
-- any commands to invoke these "settings" should be in settings/init.lua

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
    vim.bo.tabstop = n
    vim.bo.shiftwidth = n
end

-- tag mode: for files which will use xml-like syntax at any point
function M.tag_mode()
    -- lets % toggle between start & end tags
    vim.b.match_words = "<\\(\\w\\+\\)\\W:<\\/\\1"
    vim.keymap.set("i","<A-t>",function()
        require("utils").write_log{msg="We got here? I guess??"}
        vim.cmd("s/<\\(\\w\\+\\)\\(\\W.*\\)$/<\\1\\2><\\/\\1>")
        vim.cmd("s/\\(<[^>]\\+>\\)\\(<\\/[^>]\\+>\\)/\\1\\r\\2/")
    end)
end


return M
