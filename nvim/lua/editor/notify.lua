require('noice').setup({
        health = {
                checker = false,
        },
        lsp = {
                override = {
                        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                        ['vim.lsp.util.stylize_markdown'] = true,
                        ['cmp.entry.get_documentation'] = true,
                }
        },
        presets = {
                -- bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
                lsp_doc_border = true,
        },
        views = {
                cmdline_popup = {
                        border = {
                                -- style = "none",
                                padding = { 1, 2 },
                        },
                        filter_options = {},
                        win_options = {
                                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                        }
                }
        }
})
