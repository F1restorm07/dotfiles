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
        matchup = {
                enable = true,
                disable = {},
        }
}

