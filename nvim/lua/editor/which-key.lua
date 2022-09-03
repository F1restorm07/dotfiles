local which_key = require('which-key')

which_key.setup({
plugins = {
        marks = true,
        registers = true,
        },
presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
        },
})
