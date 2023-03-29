require('oil').setup({
        keymaps = {
                ["L"] = "actions.select",
                ["H"] = "actions.parent",
                ["q"] = "actions.close"
        },
        float = {
                max_width = math.floor(vim.o.columns * 0.5),
                max_height = ( vim.o.lines - vim.o.cmdheight ) * 0.5,
                win_options = {
                        winblend = 0
                }
        }
})
