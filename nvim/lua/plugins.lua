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
                                { 'ys', mode = 'n' },
                                { 'cs', mode = 'n' },
                                { 'ds', mode = 'n' },
                        },
                        config = function() require('nvim-surround').setup() end
                },
        -- }}}

        -- {{{ Extra Functionality
                {'folke/noice.nvim',
                        event = { 'CmdLineEnter', 'CursorHold' },
                        config = function() require('editor.notify') end
                },
                {'ibhagwan/fzf-lua',
                        cmd = 'FzfLua',
                        lazy = true,
                        config = function() require('search.fzf-lua') end
                },
                {'nvim-pack/nvim-spectre',
                        lazy = true,
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
                {'stevearc/overseer.nvim',
                        cmd = { 'OverseerRun', 'OverseerToggle' },
                        config = function() require('lsp.overseer') end
                },
                {'mrjones2014/smart-splits.nvim',
                        lazy = true,
                        config = function() require('smart-splits').setup() end
                },
                {'Wansmer/treesj',
                        cmd = { 'TSJToggle' },
                        dependencies = 'nvim-treesitter',
                },
        -- }}}

        {'folke/lazy.nvim', lazy = true},
        {'nvim-lua/plenary.nvim', lazy = true},
        {'MunifTanjim/nui.nvim', lazy = true},
        {'windwp/nvim-autopairs',
                event = 'InsertEnter',
                config = function() require('nvim-autopairs').setup() end
        },
-- }}}

-- {({ Language Server
        {'neovim/nvim-lspconfig',
                lazy = true,
                event = {'BufNewFile', 'InsertEnter'},
                dependencies = {'nvim-navic', 'nvim-navbuddy'},
                config = function() require('lsp.lspconfig') end
        },
        {'hrsh7th/nvim-cmp',
                event = {'InsertEnter', 'CmdLineEnter'},
                dependencies = {
                        'friendly-snippets',
                        {'hrsh7th/cmp-nvim-lsp', dependencies = 'nvim-cmp', lazy = true},
                        {'hrsh7th/cmp-buffer', dependencies = 'nvim-cmp', lazy = true},
                        {'hrsh7th/cmp-path', dependencies = 'nvim-cmp', lazy = true},
                        {'hrsh7th/cmp-cmdline', dependencies = 'cmp-buffer', lazy = true},
                        {'saadparwaiz1/cmp_luasnip', dependencies = 'LuaSnip', lazy = true},
                },
                config = function() require('lsp.cmp') end
        },
        {'SmiteshP/nvim-navic',
                lazy = true,
                config = function() require('lsp.navic') end
        },
        {'SmiteshP/nvim-navbuddy',
                lazy = true,
                config = function() require('lsp.navbuddy') end,
        },
        {'L3MON4D3/LuaSnip',
                lazy = true,
                dependencies = 'friendly-snippets'
        },
        {'rafamadriz/friendly-snippets',
                module = { 'cmp', 'cmp_nvim_lsp' },
                lazy = true,
        },
-- }}}

-- {{{ Language Specific
        {'Saecki/crates.nvim',
                event = "BufRead Cargo.toml",
                config = function() require('crates').setup() end
        },
-- }}}

-- {{{ Aesthetics
        {'nvimdev/galaxyline.nvim',
                branch = 'main',
                event = { 'BufNewFile', 'BufAdd', 'BufReadPost' },
                config = function() require('ui.galaxyline') end
        },
        {'nanozuki/tabby.nvim',
                event = { 'BufNewFile', 'BufAdd' , 'BufReadPost' },
                config = function() require('ui.tabby') end
        },
        -- {'nvim-tree/nvim-web-devicons',
        --         lazy = true,
        --         config = function()
        --                 vim.g.override_nvim_web_devicons = true
        --                 require('devicons')
        --         end
        -- },
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
                config = function() require('gitsigns').setup() end
        },
        {'nvim-zh/colorful-winsep.nvim',
                event = 'WinNew',
                config = function() require('colorful-winsep').setup() end
        },
-- }}}
-- {{{ Colorschemes
        {'shaunsingh/nord.nvim', lazy = true},
        {'AlexvZyl/nordic.nvim',
                lazy = true,
                config = function()
                        require('nordic').setup({
                        bold_keywords = true
                })
                end
        }
-- }}}

})

--[[
plugins to look into
***

epwalsh/obsidian.nvim (nvim integration with obsidian.md)

--]]
