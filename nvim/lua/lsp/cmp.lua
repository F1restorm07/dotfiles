local cmp = require('cmp')
local luasnip = require('luasnip')

-- TODO: look into neovim v0.10 snippet engine
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
        completion = { keyword_length = 2 },
        snippet = { expand = function(args) luasnip.expand(args.body) end },
        window = {
                completion = {
                        col_offest = -3,
                        side_padding = 0,
                },
                documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
                ['<s-tab>'] = cmp.mapping.scroll_docs(-4),
                ['<tab>'] = cmp.mapping.scroll_docs(4),
                ['<c-space>'] = cmp.mapping.complete(),
                ['<c-e>'] = cmp.mapping.abort(),
                ['<cr>'] = cmp.mapping.confirm({ select = false }),

                ['<c-n>'] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_locally_jumpable() then
                                luasnip.expand_or_jump()
                        else
                                fallback()
                        end
                end),
                ['<c-p>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                        else
                                fallback()
                        end
                end),
        }),
        sources = cmp.config.sources({
                { name = 'nvim_lsp', group_index = 1 },
                { name = 'luasnip', max_item_count = 3 }
        }, {
        })
})

-- cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
