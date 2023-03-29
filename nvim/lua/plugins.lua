vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
-- {{{ Utilities
        -- {{{ Keybinds
                use{'numToStr/Comment.nvim',
                        keys = {
                                { 'n', 'gcc' },
                                { 'v', 'gc' },
                                { 'n', 'gb' },
                                { 'n', 'g<' },
                                { 'n', 'g>' },
                        },
                        config = function() require('Comment').setup() end
                }
                use{'kylechui/nvim-surround',
                        keys = {
                                { 'n', 'ys' },
                                { 'n', 'cs' },
                                { 'n', 'ds' },
                        },
                        config = function() require('nvim-surround').setup() end
                }
                -- use{'kshenoy/vim-signature',
                --         keys = { 'm', 'dm' },
                -- }
        -- }}}

        -- {{{ Extra Functionality
                use{'folke/noice.nvim',
                        event = { 'CmdLineEnter', 'CursorHold' },
                        config = function() require('editor.notify') end
                }
                use{'ibhagwan/fzf-lua',
                        cmd = 'FzfLua',
                        module = 'fzf-lua',
                        config = function() require('search.fzf-lua') end
                }
                use{'ggandor/leap.nvim',
                        keys = { 's', 'S' },
                        config = function()
                                require('leap').set_default_keymaps()
                        end,
                }
                use{'RRethy/nvim-treesitter-textsubjects',
                        after = 'nvim-treesitter',
                }
                use{'tpope/vim-fugitive',
                        cmd = { 'Git', 'Gread', 'Gwrite', 'Gedit', 'Gdiffsplit', 'Ggrep', 'GMove', 'GDelete', 'GBrowse' }
                }
                use{'stevearc/oil.nvim',
                        module = 'oil',
                        config = function() require('ui.oil').setup() end
                }
                use{'stevearc/overseer.nvim',
                        cmd = { 'OverseerRun', 'OverseerToggle' },
                        config = function() require('overseer').setup() end
                }
                use{'mrjones2014/smart-splits.nvim',
                        module = 'smart-splits',
                        config = function() require('smart-splits').setup() end
                }
        -- }}}

        use{'wbthomason/packer.nvim', opt = true}
        use{'nvim-lua/plenary.nvim', module = 'plenary'}
        use{'lewis6991/impatient.nvim'}
        use{'MunifTanjim/nui.nvim', module = 'nui'}
        use{'windwp/nvim-autopairs',
                event = 'InsertEnter',
                config = function() require('nvim-autopairs').setup() end
        }
-- }}}

-- {({ Language Server
        use{'neovim/nvim-lspconfig',
                module = 'lspconfig',
                event = {'BufNewFile', 'InsertEnter'},
                config = function() require('lsp.lspconfig') end
        }

        use{'hrsh7th/nvim-cmp',
                event = {'InsertEnter', 'CmdLineEnter'},
                after = 'friendly-snippets',
                requires = {
                        {'onsails/lspkind.nvim',
                                event = { 'InsertEnter', 'CmdLineEnter'},
                                module = 'lspkind'
                        }
                },
                config = function() require('lsp.cmp') end
        }
        use{'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'}
        use{'hrsh7th/cmp-buffer', after = 'nvim-cmp'}
        use{'hrsh7th/cmp-path', after = 'nvim-cmp'}
        use{'hrsh7th/cmp-cmdline', after = 'cmp-buffer'}
        use{'saadparwaiz1/cmp_luasnip', after = 'LuaSnip'}
        use{'glepnir/lspsaga.nvim',
                branch = 'main',
                after = 'nvim-lspconfig',
                config = function() require('lsp.lspsaga') end
        }
        use{'L3MON4D3/LuaSnip',
                after = 'nvim-cmp',
                requires = 'friendly-snippets'
        }
        use{'rafamadriz/friendly-snippets',
                module = { 'cmp', 'cmp_nvim_lsp' },
                event = 'InsertEnter',
        }
-- }}}

-- {{{ Language Specific
        use{'Saecki/crates.nvim',
                event = "BufRead Cargo.toml",
                config = function() require('crates').setup() end
        }
-- }}}

-- {{{ Aesthetics
        use{'glepnir/galaxyline.nvim',
                branch = 'main',
                event = { 'BufNewFile', 'BufAdd', 'BufReadPost' },
                config = function() require('ui.galaxyline') end
        }
        use{'nanozuki/tabby.nvim',
                event = { 'BufNewFile', 'BufAdd' , 'BufReadPost' },
                config = function() require('ui.tabby') end
        }
        use{'nvim-tree/nvim-web-devicons',
                module = 'nvim-web-devicons',
                config = function()
                        vim.g.override_nvim_web_devicons = true
                        require('devicons')
                end
        }
        use{'goolord/alpha-nvim',
                after = 'nord.nvim',
                config = function() require('ui.alpha-nvim') end
        }
        use{'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate',
                event = 'CursorHold',
                config = function() require('editor.nvim-treesitter') end
        }
        use{'lewis6991/gitsigns.nvim',
                event = { 'BufNewFile', 'BufReadPost' },
                config = function() require('gitsigns').setup() end
        }
        use{'nvim-zh/colorful-winsep.nvim',
                event = 'WinNew',
                config = function() require('colorful-winsep').setup() end
        }
-- }}}
-- {{{ Colorschemes
        use{'shaunsingh/nord.nvim'}
-- }}}

end,
config = {
        display = {
                open_fn = function ()
                        return require('packer.util').float({ border = 'single' })
                end
        },
        profile = {
                enable = true,
        }
}})
