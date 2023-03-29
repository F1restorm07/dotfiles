require'nvim-treesitter.configs'.setup {
        ensure_installed = {
                "rust",
                "toml",
                "bash",
                "lua",
                "vim",
                "regex",
                "markdown",
                "markdown_inline",
                "wgsl",
        },
        sync_install = false,
        ignore_install = { "javascript" },
        highlight = {
                enable = true,
                disable = {},
        },
        textsubjects = {
                enable = true,
                prev_selection = '\'',
                keymaps = {
                        ['?'] = "textsubjects-smart",
                        [';'] = "textsubjects-container-outer",
                        ['i;'] = "textsubjects-container-inner"
                }
        }
}

