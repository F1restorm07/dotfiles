return {
    {'tpope/vim-fugitive',
            cmd = { 'Git', 'Gread', 'Gwrite', 'Gedit', 'Gdiffsplit', 'Ggrep', 'GMove', 'GDelete' }
    },
    {'lewis6991/gitsigns.nvim',
            event = { 'BufNewFile', 'BufReadPost' },
            tag = 'release',
            config = function() require('gitsigns').setup() end
    },
}
