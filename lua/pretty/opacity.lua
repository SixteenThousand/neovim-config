vim.g.six_transparent = false

vim.keymap.set("n","<leader>co",function()
    vim.g.six_transparent = not vim.g.six_transparent
    if vim.g.neovide then
        if vim.g.six_transparent then
            vim.g.neovide_transparency = 0.9
       else
            vim.g.neovide_transparency = 1.0
        end
        return
    end
    if vim.g.colors_name == "everforest" then
        vim.g.everforest_transparent_background = vim.g.six_transparent
    elseif vim.g.colors_name == "sonokai" then
        vim.g.sonokai_transparent_background = vim.g.six_transparent
    elseif vim.g.colors_name:match("^kanagawa") then
        require("kanagawa").setup({
            transparent = vim.g.six_transparent
        })
    elseif vim.g.colors_name:match("^catppuccin") then
        require("catppuccin").setup({
            transparent_background = vim.g.six_transparent
        })
    elseif vim.g.colors_name:match("^material") then
        require("material").setup({
            disable = {
                background = not vim.g.six_transparent
            }
        })
    elseif vim.g.colors_name:match("fox$") then
        require("nightfox").setup({
            options = {
                transparent = vim.g.six_transparent
            }
        })
    end
    vim.cmd.colorscheme(vim.g.colors_name)
end)
