local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.wgsl = {
        install_info = {
                url = "https://github.com/szebniok/tree-sitter-wgsl",
                files = {"src/parser.c"}
                }
        }

require'nvim-treesitter.configs'.setup {
        ensure_installed = { "rust", "toml", "kotlin", "elixir", "lua", "vim", "org", "markdown", "wgsl", "svelte" },
        sync_install = false,
        ignore_install = { "javascript" },
        highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = {"org"},
                },
        incremental_selection = {
                enable = true,
                keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                        },
                },
        }

