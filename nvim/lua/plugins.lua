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
                {'ggandor/leap.nvim',
                        keys = {
                                { 's', mode = 'n' },
                                { 'S', mode = 'n' },
                        },
                        config = function()
                                require('leap').set_default_keymaps()
                        end,
                },
                {'RRethy/nvim-treesitter-textsubjects',
                        lazy = true,
                        module = {'nvim-treesitter'},
                },
                {'tpope/vim-fugitive',
                        cmd = { 'Git', 'Gread', 'Gwrite', 'Gedit', 'Gdiffsplit', 'Ggrep', 'GMove', 'GDelete' }
                },
                {'stevearc/overseer.nvim',
                        cmd = { 'OverseerRun', 'OverseerToggle' },
                        config = function() require('overseer').setup() end
                },
                {'mrjones2014/smart-splits.nvim',
                        lazy = true,
                        config = function() require('smart-splits').setup() end
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
                config = function() require('lsp.lspconfig') end
        },
        {'hrsh7th/nvim-cmp',
                event = {'InsertEnter', 'CmdLineEnter'},
                dependencies = {
                        {'onsails/lspkind.nvim',
                                event = { 'InsertEnter', 'CmdLineEnter'},
                                lazy = true
                        },
                        'rafamadriz/friendly-snippets',
                        {'hrsh7th/cmp-nvim-lsp', dependencies = 'nvim-cmp', lazy = true},
                        {'hrsh7th/cmp-buffer', dependencies = 'nvim-cmp', lazy = true},
                        {'hrsh7th/cmp-path', dependencies = 'nvim-cmp', lazy = true},
                        {'hrsh7th/cmp-cmdline', dependencies = 'cmp-buffer', lazy = true},
                        {'saadparwaiz1/cmp_luasnip', dependencies = 'LuaSnip', lazy = true},
                },
                config = function() require('lsp.cmp') end
        },
        {'glepnir/lspsaga.nvim',
                branch = 'main',
                event = { 'LspAttach' },
                config = function() require('lsp.lspsaga') end
        },
        {'L3MON4D3/LuaSnip',
                lazy = true,
                dependencies = 'friendly-snippets'
        },
        {'rafamadriz/friendly-snippets',
                module = { 'cmp', 'cmp_nvim_lsp' },
                event = 'InsertEnter',
        },
-- }}}

-- {{{ Language Specific
        {'Saecki/crates.nvim',
                event = "BufRead Cargo.toml",
                config = function() require('crates').setup() end
        },
-- }}}

-- {{{ Aesthetics
        {'glepnir/galaxyline.nvim',
                branch = 'main',
                event = { 'BufNewFile', 'BufAdd', 'BufReadPost' },
                config = function() require('ui.galaxyline') end
        },
        {'nanozuki/tabby.nvim',
                event = { 'BufNewFile', 'BufAdd' , 'BufReadPost' },
                config = function() require('ui.tabby') end
        },
        {'nvim-tree/nvim-web-devicons',
                lazy = true,
                config = function()
                        vim.g.override_nvim_web_devicons = true
                        require('devicons')
                end
        },
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
        {'shaunsingh/nord.nvim', lazy = true}
-- }}}

})

--[[
plugins to look into
***

sidebar-nvim/sidebar.nvim (mpdular, customizable sidebar)
Idelossa/nvim-ide (complete ide layer -> everything in sidebars)
ggandor/flit.nvim (enhanced f/t movement -> builds on leap.nvim)
andymass/vim-matchup (enhanced % movement)
chentoast/marks.nvim (enhanced vim marks)
nvim-treesitter/nvim-treesitter-textobjects
stevearc/oil.nvim (edit filesystem like a vim buffer)
epwalsh/obsidian.nvim (nvim integration with obsidian.md)

--]]
