local symbol_map = require('icons').symbol_map
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
        formatting = {
                fields = { "kind", "abbr" },
                format = function(entry, vim_item)
                        local kind = lspkind.cmp_format({
                                mode = "symbol",
                                maxwidth = 50,
                                symbol_map = symbol_map
                        })(entry, vim_item)

                        kind.kind = ' ' .. kind.kind .. '  '
                        kind.dup = ({
                                luasnip = 0,
                                nvim_lsp = 0,
                                buffer = 0,
                        })[entry.source.name] or 0

                        return kind
                end
        },
        snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
        require('luasnip').lsp_expand(args.body)
        end,
        },
        window = {
                completion = {
                        winhighlight = "Normal:Pmenu",
                        col_offest = -3,
                        side_padding = 0,
                },
                documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'luasnip' },
        }, {
                { name = 'buffer' },
        })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
        { name = 'buffer' },
        })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
        { name = 'buffer' }
        },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
        { name = 'path' }
        }, {
        { name = 'cmdline' }
        })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {
        'rust_analyzer',
        'elixirls',
        'lua_ls',
        'denols'
}
for _, lsp in pairs(servers) do
        require('lspconfig')[lsp].setup {
        capabilities = capabilities
        }
end

cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
