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

vim.diagnostic.config({
    severity_sort = true,
    underline = {
        severity = vim.diagnostic.severity.ERROR
    },
    virtual_text = {
        source = "if_many"
    },
})

vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = ""})
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = ""})
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = ""})
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = ""})
