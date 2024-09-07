require("nvim-treesitter.configs").setup({
    highlight = {
        enable = false,
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start  = {
                ["]m"] = "@function.outer",
                ["]o"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]O"] = "@class.outer",
            },
            goto_previous_start  = {
                ["[m"] = "@function.outer",
                ["[o"] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[O"] = "@class.outer",
            },
        },
        select = {
            enable = true,
            keymaps = {
                ["if"] = "@function.inner",
                ["af"] = "@function.outer",
                ["as"] = "@scope",
                ["ar"] = "@parameter.outer",
                ["ir"] = "@parameter.inner",
                ["ac"] = "@class.outer",
            },
            selection_modes = {
                ["@function.inner"] = "V",
                ["@function.outer"] = "V",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>sr"] = "@parameter.inner",
            },
            swap_previous = {
                ["<Leader>sR"] = "@parameter.outer",
                ["<Leader>sf"] = "@parameter.outer",
            },
        },
    },
})
