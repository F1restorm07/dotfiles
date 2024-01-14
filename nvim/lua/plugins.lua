return require('lazy').setup({
-- {{{ Utilities
        -- {{{ Keybinds
                {'numToStr/Comment.nvim',
                        keys = {
                                { 'gcc', mode = 'n' },
                                { 'gc', mode = 'v' },
                                { 'gb', mode = 'n' },
                                { 'g<', mode = 'n' },
                                { 'g>', mode = 'n' },
                        },
                        config = function() require('Comment').setup() end
                },
                {'kylechui/nvim-surround',
                        keys = {
                                { 'ys', mode = {'n', 'v'} },
                                { 'cs', mode = 'n' },
                                { 'ds', mode = 'n' },
                        },
                        config = function() require('nvim-surround').setup() end
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
                {'sindrets/winshift.nvim', cmd = { 'WinShift' }},
                {'j-hui/fidget.nvim',
                        event = {'LspAttach'},
                        config = function() require('editor.fidget') end
                },
        -- }}}

        {'folke/lazy.nvim', tag = 'stable', lazy = true},
        {'m4xshen/autoclose.nvim',
                event = 'InsertEnter',
                config = function() require('autoclose').setup() end
        },
-- }}}

-- {({ Language Server
        {'hrsh7th/cmp-nvim-lsp', lazy = true},
        {'SmiteshP/nvim-navic', lazy = true, config = function() require('lsp.navic') end},
        -- {'hinell/lsp-timeout.nvim', event = {'LspAttach'}},
        {'neovim/nvim-lspconfig',
                cmd = "LspStart",
                config = function() require('lsp.lspconfig') end
        },
        {'hrsh7th/nvim-cmp',
                lazy = true,
                event = {'LspAttach'},
                dependencies = {
                        {'saadparwaiz1/cmp_luasnip', lazy = true}
                },
                config = function() require('lsp.cmp') end
        },
        {'L3MON4D3/LuaSnip',
                lazy = true,
                version = 'v2.*',
                dependencies = {'rafamadriz/friendly-snippets', lazy = true},
                config = function() require('lsp.luasnip') end
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
                dependencies = {
                        {'nvim-treesitter/nvim-treesitter-textobjects', lazy = true}
                },
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
-- }}}
-- {{{ Colorschemes
        {'neanias/everforest-nvim',
                lazy = true,
                opts = { background = 'hard' },
                config = function() require('everforest').setup() end
        }
-- }}}

})

--[[
plugins to look into
***
stevearc/conform.nvim // lightweight formatting plugin
echasnovski/mini.clue // minimal keymap clue display
--]]
