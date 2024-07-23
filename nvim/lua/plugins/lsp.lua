return {
    {'neovim/nvim-lspconfig',
        cmd = 'LspStart',
        config = function()
            local lspconfig = require('lspconfig')

            local function on_attach(client, bufnr)
                vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp" -- taken from echasnovski's nvim config
            end

            lspconfig.rust_analyzer.setup {
                on_attach = on_attach,
                autostart = false,
                settings = {
                    ['rust-analyzer'] = {
                        checkOnSave = {
                            command = "clippy"
                        },
                        imports = {
                            granularity = {
                                group = "module"
                            },
                            prefix = "self"
                        },
                        cargo = {
                            buildScripts = {
                                enable = true
                            }
                        },
                        procMacro = {
                            enable = true
                        }
                    }
                }
            }

            lspconfig.lua_ls.setup {
                on_attach = on_attach,
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
                        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME,
                                    }
                                },
                                diagnostics = {
                                    globals = {'vim'},
                                }
                            }
                        })

                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                    end
                    return true
                end,
                autostart = false,
            }

            lspconfig.jdtls.setup {
                on_attach = on_attach
            }
        end
    },
    {'echasnovski/mini.completion',
        event = 'LspAttach',
        opts = {
            lsp_completion = {
                source_func = 'omnifunc',
                auto_setup = false,
            },
            window = {
                signature = { border = 'single' }
            },
            delay = { signature = 100000000 } -- virtually disable the signature info, because it can tank the performance
        },
    },
    {'j-hui/fidget.nvim',
        event = 'LspAttach',
        -- TODO: integrate with all vim.notify() notifications
        opts = {
            progress = {
                display = {
                    done_icon = "[*-*]"
                },
            },
        },
    },
    {'Saecki/crates.nvim',
            event = 'BufRead Cargo.toml',
            tag = 'stable',
            dependencies = {{'nvim-lua/plenary.nvim', lazy = true}},
    },
}
