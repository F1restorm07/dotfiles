local clue = require('mini.clue')
clue.setup({
    triggers = {
        { mode = 'n', keys = '<leader>' },
        { mode = 'x', keys = '<leader>' },
        { mode = 'n', keys = ';' },
        { mode = 'x', keys = ';' },
        { mode = 'n', keys = 't' },
        { mode = 'x', keys = 't' },

        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
        { mode = 'n', keys = '[' },
        { mode = 'x', keys = '[' },
        { mode = 'n', keys = ']' },
        { mode = 'x', keys = ']' },
    },
    clues = {
        { mode = 'n', keys = '<leader>c', desc = "crates.nvim"},
        { mode = 'n', keys = '<leader>d', desc = "diagnostics"},
        { mode = 'n', keys = '<leader>f', desc = "fuzzy finder"},
        { mode = 'n', keys = '<leader>l', desc = "lsp"},

        clue.gen_clues.g(),
        clue.gen_clues.z(),
    },
    window = {
        config = {
            width = 'auto',
        }
    }
})
