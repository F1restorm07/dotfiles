return {
    {'tpope/vim-fugitive',
            cmd = { 'Git', 'Gread', 'Gwrite', 'Gedit', 'Gdiffsplit', 'Ggrep', 'GMove', 'GDelete' },
            event = { 'BufNewFile', 'BufReadPost', 'VeryLazy' },
    },
    {'echasnovski/mini.diff',
            event = { 'BufNewFile', 'BufReadPost' },
            config = function() require('mini.diff').setup({
                -- may replace default signs with characters
                view = {
                    style = 'sign',
                    signs = { add = '+', change = '~', delete = '-' }
                },

            }) end
    },
}
