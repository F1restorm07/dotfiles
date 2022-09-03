local actions = require("lir.actions")

require("lir").setup({
        devicons_enable = true,
        mappings = {
                ['l'] = actions.edit,
                ['s'] = actions.split,
                ['v'] = actions.vsplit,
                ['t'] = actions.tabedit,
                ['h'] = actions.up,
                ['q'] = actions.quit,
                ['K'] = actions.mkdir,
                ['N'] = actions.newfile,
                ['r'] = actions.rename,
                ['-'] = actions.cd,
                ['y'] = actions.yank_path,
                ['.'] = actions.toggle_show_hidden,
                ['D'] = actions.delete,
        },
        float = {
                winblend = 0,
                curdur_window = {
                        enable = false,
                        highlight_dirname = false,
                },
                win_opts = function()
                        local width = math.floor(vim.o.columns * 0.8)
                        local height = math.floor(vim.o.lines * 0.8)

                        return {
                                border = {
                                        '╭', '─', '╮', '│', '╯', '─', '╰', '│'
                                },
                                width = width,
                                height = height,
                                row = 1,
                                col = math.floor((vim.o.columns - width) / 2),
                        }
                end,
        },
        hide_cursor = true,
})
