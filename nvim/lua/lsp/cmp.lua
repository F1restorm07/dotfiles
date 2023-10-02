local cmp = require'cmp'
local luasnip = require('luasnip')

cmp.setup({
        formatting = {
                fields = { "kind", "abbr" },
                format = function(entry, vim_item)
                        vim_item.kind = ''
                        vim_item.dup = ({
                                luasnip = 0,
                                nvim_lsp = 0,
                                buffer = 0,
                        })[entry.source.name] or 0

                        return vim_item
                end
        },
        completion = {
                keyword_length = 2
        },
        snippet = {
                expand = function(args)
                        luasnip.lsp_expand(args.body)
                end,
        },
        window = {
                completion = {
                        -- winhighlight = "Normal:Pmenu",
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
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'luasnip' },
        }, {
                { name = 'buffer' },
        })
})

cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
        { name = 'buffer' }
        },
})

cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
        { name = 'path' }
        }, {
        { name = 'cmdline' }
        })
})

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
