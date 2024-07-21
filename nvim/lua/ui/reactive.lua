local colors = require('highlights').colors  -- TODO: add color changes for commands (<leader>, ;, t, etc) + CursorLineNr highlights

require('reactive').add_preset { -- the CursorLine colors are darker shades of the Cursor colors
    name = "personal",
    skip = function()
        return vim.api.nvim_buf_get_option(0, 'buftype') == "nofile"
    end,
    init = function()
        vim.opt.guicursor:append("a:ReactiveCursor")
        vim.o.cursorline = true
    end,
    modes = {
        n = {
            winhl = {
                CursorLine = { bg = colors.bg_blue },
            },
            hl = {
                ReactiveCursor = { bg = colors.blue },
            }
        },
        i = {
            winhl = {
                CursorLine = { bg = colors.bg_purple },
            },
            hl = {
                ReactiveCursor = { bg = colors.purple },
            }
        },
        c = {
            winhl = {
                CursorLine = { bg = colors.bg_orange },
            },
            hl = {
                ReactiveCursor = { bg = colors.orange },
            }
        },
        [{'v', 'V', ''}] = {
            winhl = {
                Visual = { bg = colors.bg_aqua },
            },
            hl = {
                ReactiveCursor = { bg = colors.aqua },
            }
        },
        [{'s', 'S'}] = {
            winhl = {
                CursorLine = { bg = colors.bg_green },
            },
            hl = {
                ReactiveCursor = { bg = colors.green },
            }
        },
        R = {
            winhl = {
                CursorLine = { bg = colors.bg_green },
            },
            hl = {
                ReactiveCursor = { bg = colors.green },
            }
        },
    }
}
