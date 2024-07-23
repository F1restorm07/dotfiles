return {
    {'kylechui/nvim-surround',
            keys = {
                    { 'ys', mode = {'n', 'v'} },
                    { 'cs', mode = 'n' },
                    { 'ds', mode = 'n' },
            },
    },
    {'echasnovski/mini.ai', -- TODO: add treesitter objects
        keys = {
            { 'a', mode = {'n', 'v'} },
            { 'i', mode = {'n', 'v'} },
        },
    },
    {'ggandor/leap.nvim',
            keys = {
                    { 's', mode = 'n' },
                    { 'S', mode = 'n' },
            },
            config = function()
                    require('leap').set_default_keymaps()
            end,
    },
    {'ggandor/flit.nvim',
            keys = {
                    { 'f', mode = 'n' },
                    { 'F', mode = 'n' },
                    { 't', mode = 'n' },
                    { 'T', mode = 'n' },
            },
            dependencies = 'leap.nvim',
    },
    {'otavioschwanck/arrow.nvim',
        keys = {
            { '\\', mode = 'n' },
            { 'm', mode = 'n' }
        },
        opts = {
            show_icons = true,
            leader_key = '\\',
            buffer_leader_key = 'm',
        },
    },
    {'echasnovski/mini.clue',
        keys = {
            { ',', mode = {'n', 'x'} }, -- leader key
            { ';', mode = {'n', 'x'} },
            { 't', mode = {'n', 'x'} },
            { 'g', mode = {'n', 'x'} },
            { 'z', mode = {'n', 'x'} },
        },
        config = function()
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
        end
    },
    {'m4xshen/autoclose.nvim',
        event = 'InsertEnter',
        opts = {
            options = {
                disable_when_touch = true,
                pair_spaces = true,
            },
        },
    },
    {'ibhagwan/fzf-lua',
        cmd = 'FzfLua',
        opts = {
            previewers = {
                    builtin = {
                            extensions = {
                                    ['png'] = { 'wezterm', 'imgcat', '--resize', '800x600' },
                                    ['jpg'] = { 'wezterm', 'imgcat', '--resize', '800x600' },
                                    ['webp'] = { 'wezterm', 'imgcat', '--resize', '800x600' }
                            }
                    }
            },
        },
    },
    {'tpope/vim-dispatch', cmd = { 'Make','Dispatch' }},
    {'sindrets/winshift.nvim', cmd = { 'WinShift' }},
}
