local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
require('alpha.term')

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

local footer = {
        type = "text",
        val = "loaded " .. #vim.tbl_keys(packer_plugins) .. " plugins",
        opts = {
                position = "center",
                hl = "AlphaFooter"
        }
}

alpha.setup {
        layout = {
                { type = "padding", val = 2 },
                header,
                { type = "padding", val = 9 },
                buttons,
                { type = "padding", val = 2 },
                footer
        }
}
