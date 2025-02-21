return {
    --- DEPENDENCIES
    "plenary.nvim",
    "nvim-web-devicons",
    "nvim-treesitter",
    --- EXTENSIONS PROPER
    -- colourschemes
    "everforest",
    "nvim", -- catppuccin
    "nightfox.nvim",
    {
        dirname = "lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    -- note lualine is also mentioned in the <A-r> remap in 
                    -- remap.lua
                    -- 
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = {"filename"},
                    lualine_b = {"branch","diff"},
                    lualine_c = {"diagnostics"},
                    lualine_x = {"fileformat","filesize"},
                    lualine_y = {"progress","filetype","tabs"},
                    lualine_z = {"location"},
                },
            })
        end,
    },
    -- IDE-like stuff
    {
        dirname = "mason.nvim",
        setup = "mason",
    },
    "nvim-lspconfig",
    "LuaSnip",
    {
        dirname = "Comment.nvim",
        setup = "Comment",
    },
    {
        dirname = "nvim-treesitter-textobjects",
        config = function()
            require("plugins.treesitter")
        end,
    },
    "telescope.nvim",
    {
        dirname = "vim-fugitive",
        config = function()
            require("plugins.fugitive")
        end,
    },
    "vim-jsx-pretty",
    "vim-surround",
    {
        dirname = "markdown.nvim",
        setup = "markdown",
    },
}
