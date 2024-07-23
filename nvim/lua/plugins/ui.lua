return {
    {'goolord/alpha-nvim',
        lazy = false,
        config = function()
            local alpha = require('alpha')

            local function button(sc, txt, keybind, keybind_opts)
                    local sc_ = sc:gsub("%s", "")

                    local opts = {
                            position = "center",
                            text = txt,
                            shortcut = sc,
                            cursor = 5,
                            width = 50,
                            align_shortcut = "right",
                            hl  = "AlphaButton"
                    }

                    if keybind then
                            opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true }}
                    end

                    return {
                            type = "button",
                            val = txt,
                            on_press = function ()
                                    local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
                                    vim.api.nvim_feedkeys(key, "normal", false)
                            end,
                            opts = opts,
                    }
            end

            local header = {
                    type = "text",
                    val = require('headers').planet,
                    opts = {
                            position = "center",
                            hl = "AlphaHeader"
                    }
            }

            local buttons = {
                    type = "group",
                    val = {
                            button('f', "Find Files", ":FzfLua files<cr>"),
                            button('g', "Find Word", ":FzfLua grep<cr>")
                    },
                    opts = {
                            spacing = 1,
                            hl = "AlphaButton"
                    }
            }

            alpha.setup({
                    layout = {
                            { type = "padding", val = 2 },
                            header,
                            { type = "padding", val = 9 },
                            buttons,
                            { type = "padding", val = 2 },
                    }
            })
        end
    },
    {'rasulomaroff/reactive.nvim',
        event = 'CursorHold',
        config = function()
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
        end
    },
    {'nvim-zh/colorful-winsep.nvim', event = 'WinNew'},
}
