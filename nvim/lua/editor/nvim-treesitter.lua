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
}
