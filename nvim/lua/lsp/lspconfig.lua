local lspconfig = require('lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.util.on_setup = lspconfig.util.add_hook_after(lspconfig.util.on_setup, function(config)
        config.capabilities = vim.tbl_deep_extend(config.capabilities, cmp_capabilities)
end)

local function on_attach(client, bufnr)
    if client.server_capabilities["documentSymbolProvider"] then
        require('nvim-navic').attach(client, bufnr)
        vim.o.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"
    end
    -- if client.server_capabilities["inlayHintProvider"] then
    --     vim.lsp.inlay_hint.enable(bufnr, true)
    -- end
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
                    }
                }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
    end,
    autostart = false,
}

vim.diagnostic.config({
    severity_sort = true,
    underline = {
        severity = vim.diagnostic.severity.ERROR
    },
    virtual_text = {
        source = "if_many"
    }
})
