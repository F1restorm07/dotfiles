require'nvim-treesitter.configs'.setup {
        ensure_installed = {
                "rust",
                "toml",

                "lua",
                "vim",

                "bash",
                "query",
                "vimdoc",
                "regex",

                "markdown",
                "markdown_inline",
        },
        sync_install = false,
        ignore_install = { "javascript" },
        highlight = { enable = true },
        indent = { enable = true },
        textobjects = {
                select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                                ["aa"] = "@assignment.outer",
                                ["ia"] = "@assignment.inner",
                                ["ab"] = "@block.outer",
                                ["ib"] = "@block.inner",
                                ["ac"] = "@class.outer",
                                ["ic"] = "@class.inner",
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ap"] = "@parameter.outer",
                                ["ip"] = "@parameter.inner",
                        }
                },
                move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                                ["]c"] = "@class.outer",
                                ["]f"] = "@function.outer",
                                ["]s"] = { query = "@scope", query_group = "locals" },
                        },
                        goto_next_end = {
                                ["]C"] = "@class.outer",
                                ["]F"] = "@function.outer",
                                ["]S"] = { query = "@scope", query_group = "locals" },
                        },
                        goto_previous_start = {
                                ["[c"] = "@class.outer",
                                ["[f"] = "@function.outer",
                                ["[s"] = { query = "@scope", query_group = "locals" },
                        },
                        goto_previous_end = {
                                ["[C"] = "@class.outer",
                                ["[F"] = "@function.outer",
                                ["[S"] = { query = "@scope", query_group = "locals" },
                        },
                }
        }
}

