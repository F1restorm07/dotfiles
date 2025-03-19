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
                            button('f', "Find Files", "<cmd>FzfLua files<cr>"),
                            button('g', "Find Word", "<cmd>FzfLua grep<cr>"),
                            button('u', "Update Plugins", "<cmd>Lazy sync<cr>"),
                            button('n', "New File", "<cmd>enew<cr>"), -- TODO: add prompt for relative file path
                            button('w', "Open Workspace", "<cmd>WorkspacesOpen<cr>"),
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
    {'mvllow/modes.nvim',
        event = 'CursorHold',
        config = function()
            local colors = require('highlights').colors
            require('modes').setup({
                colors = {
                    insert = colors.purple,
                    visual = colors.aqua,
                    delete = colors.red,
                    copy = colors.yellow,
                },
            })
        end
    },
    {'OXY2DEV/markview.nvim', ft = { 'markdown', 'yaml', 'latex', 'html', 'typst' }, opts = {}},
    {'OXY2DEV/helpview.nvim', ft = { 'help' }, opts = {}},
}
