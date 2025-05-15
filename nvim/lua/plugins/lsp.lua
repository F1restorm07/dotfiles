return {
    {'Saghen/blink.cmp',
        lazy = true,
        version = '1.*',
        event = 'LspAttach',
        opts = {
            keymap = { preset = 'super-tab' },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { 'lsp' }
            },
            signature = {
                enabled = true,
                window = {
                    show_documentation = false
                },
            }
        },
    },
    {'j-hui/fidget.nvim',
        event = 'CursorHold',
        -- TODO: test lsp progress (it seems to not work right now)
        opts = {
            progress = {
                display = {
                    done_icon = "[*-*]"
                },
            },
            notification = {
                override_vim_notify = true,
            }
        },
    },
    -- TODO: replace crate versions with custom implementation (maybe)
    {'Saecki/crates.nvim',
            event = 'BufRead Cargo.toml',
            tag = 'stable',
            dependencies = {{'nvim-lua/plenary.nvim', lazy = true}},
            config = function() require('crates').setup() end
    },
    -- {'neovim/nvim-lspconfig',
    --     cmd = 'LspStart',
    --     config = function()
    --         local lspconfig = require('lspconfig')
    --         local capabilities = require('blink.cmp').get_lsp_capabilities()
    --
    --         lspconfig.ccls.setup {
    --             capabilities = capabilities,
    --         }
    --         lspconfig.pylsp.setup {
    --             settings = {
    --                 ['pylsp'] = {
    --                     plugins = {
    --                         pylint = { enabled = true, executable = "pylint" },
    --                         pyflakes = { enabled = false },
    --                         pycodestyle = { enabled = false },
    --                         pylsp_mypy = { enabled = true },
    --                         jedi_completion = { fuzzy = true },
    --                     },
    --                 },
    --             },
    --             capabilities = capabilities,
    --         }
    --     end
    -- },
}
