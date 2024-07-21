return require('lazy').setup({
-- {{{ Utilities
        -- {{{ Keybinds
                {'kylechui/nvim-surround',
                        keys = {
                                { 'ys', mode = {'n', 'v'} },
                                { 'cs', mode = 'n' },
                                { 'ds', mode = 'n' },
                        },
                        config = function() require('nvim-surround').setup() end
                },
                {'echasnovski/mini.ai',
                    keys = {
                        { 'a', mode = {'n', 'v'} },
                        { 'i', mode = {'n', 'v'} },
                    },
                    config = function() require('mini.ai').setup() end -- TODO: add treesitter objects
                },
        -- }}}

        -- {{{ Extra Functionality
                {'ibhagwan/fzf-lua',
                        cmd = 'FzfLua',
                        lazy = true,
                        config = function() require('search.fzf-lua') end
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
                        config = function() require('flit').setup() end
                },
                {'tpope/vim-fugitive',
                        cmd = { 'Git', 'Gread', 'Gwrite', 'Gedit', 'Gdiffsplit', 'Ggrep', 'GMove', 'GDelete' }
                },
                {'tpope/vim-dispatch', cmd = { 'Make','Dispatch' }},
                {'sindrets/winshift.nvim', cmd = { 'WinShift' }},
                {'j-hui/fidget.nvim',
                        event = {'LspAttach'},
                        config = function() require('editor.fidget') end
                },
                {'otavioschwanck/arrow.nvim',
                    keys = {
                        { '\\', mode = 'n' },
                        { 'm', mode = 'n' }
                    },
                    config = function() require('arrow').setup({show_icons = true, leader_key = '\\', buffer_leader_key = 'm'}) end
                },
                {'echasnovski/mini.clue',
                    keys = {
                        { ',', mode = {'n', 'x'} }, -- leader key
                        { ';', mode = {'n', 'x'} },
                        { 't', mode = {'n', 'x'} },
                        { 'g', mode = {'n', 'x'} },
                        { 'z', mode = {'n', 'x'} },
                    },
                    config = function() require('editor.clue') end
                },
        -- }}}

        {'folke/lazy.nvim', tag = 'stable', lazy = true},
        {'m4xshen/autoclose.nvim',
                event = 'InsertEnter',
                config = function() require('editor.autoclose') end
        },
-- }}}

-- {({ Language Server
        {'neovim/nvim-lspconfig',
                cmd = "LspStart",
                config = function() require('lsp.lspconfig') end
        },
        {'echasnovski/mini.completion', -- may replace with glepnir/epo.nvim when it no longer requires nightly
            event = "LspAttach",
            config = function() require('lsp.completion') end
        },
-- }}}

-- {{{ Language Specific
        {'Saecki/crates.nvim',
                event = 'BufRead Cargo.toml',
                tag = 'stable',
                dependencies = {{'nvim-lua/plenary.nvim', lazy = true}},
                config = function() require('crates').setup() end
        },
-- }}}

-- {{{ Aesthetics
        {'goolord/alpha-nvim',
                lazy = false,
                config = function() require('ui.alpha-nvim') end
        },
        {'nvim-treesitter/nvim-treesitter',
                build = ':TSUpdate',
                event = 'CursorHold',
                config = function() require('editor.nvim-treesitter') end
        },
        {'lewis6991/gitsigns.nvim',
                event = { 'BufNewFile', 'BufReadPost' },
                tag = 'release',
                config = function() require('gitsigns').setup() end
        },
        {'nvim-zh/colorful-winsep.nvim',
                event = 'WinNew',
                config = function() require('colorful-winsep').setup() end
        },
        {'rasulomaroff/reactive.nvim',
            event = 'CursorHold',
            config = function() require('ui.reactive') end
        },
-- }}}
-- {{{ Colorschemes
        {'cocopon/iceberg.vim', lazy = true}
-- }}}

})

--[[
plugins to look into
***
stevearc/conform.nvim           // lightweight formatting plugin
echasnovski/mini.files          // navigate and manipulate the file system
VonHeikemen/searchbox.nvim      // popup search window
VonHeikemen/fine-cmdline.nvim   // popup cmdline window
echasnovski/mini.splitjoin      // split and join lines
--]]

--[[
plugins to replace with custom implementation
***
alpha.nvim (basic greeter buffer)
crates.nvim (keep only version + feature checks)
fine-cmdline.nvim (take implementation from cmdpalette.nvim)
--]]
