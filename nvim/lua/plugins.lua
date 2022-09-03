vim.cmd [[packadd packer.nvim]]

local treesitter_filetypes = {
        'markdown',
        'rust',
        'lua',
        'norg',
        'vim',
        'toml',
        'wgsl',
        'kotlin',
        'svelte',
        'sh'
}
return require('packer').startup({function(use)
-- {{{ Utilities
        -- {{{ Keybinds
                use{'numToStr/Comment.nvim',
                        keys = { 'gc', 'gb', 'g<', 'g>'},
                        module = { 'Comment', 'Comment.api' },
                        config = function() require('Comment').setup() end
                }
                use{'kylechui/nvim-surround',
                        keys = { 'ys', 'cs', 'ds' },
                        config = function() require('nvim-surround').setup() end
                }
                use{'otavioschwanck/cool-substitute.nvim',
                        keys = { 'gm', 'gM', 'g!M' },
                        config = function() require('cool-substitute').setup({
                                setup_keybindings = true,
                                })
                        end
                }
                use{'wellle/targets.vim',  opt = true}
                use{'anuvyklack/hydra.nvim', module = 'hydra'}
                use{'tpope/vim-unimpaired', keys = { '[', ']' }}
        -- }}}

        -- {{{ Extra Functionality
                use{'rcarriga/nvim-notify'}
                use{'nvim-telescope/telescope.nvim',
                        cmd = 'Telescope',
                        module = 'telescope',
                        config = function() require('search.telescope') end
                }
                use{'nvim-telescope/telescope-fzf-native.nvim',
                        after = 'telescope.nvim',
                        run = 'make',
                        config = function() require'telescope'.load_extension('fzf') end
                }
                use{'nvim-telescope/telescope-frecency.nvim',
                        module = 'telescope',
                        config = function() require'telescope'.load_extension('frecency') end
                }
                use{'ggandor/leap.nvim',
                        keys = { 's', 'S' },
                        config = function()
                                require('leap').set_default_keymaps()
                        end,
                }
                use{'jinh0/eyeliner.nvim',
                        keys = { 'f', 'F' },
                        config = function() require('eyeliner').setup({
                                        highlight_on_key = true
                                })
                        end
                }
                use{'TimUntersberger/neogit', keys = '<leader>g', cmd = "Neogit" }
                use{'tamago324/lir.nvim',
                        module = 'lir',
                        event = 'VimEnter',
                        config = function() require('ui.lir') end
                }
                use{'mbbill/undotree',
                        cmd = "UndoTreeToggle"
                }
        -- }}}

        use{'wbthomason/packer.nvim', opt = true}
        use{'nvim-lua/plenary.nvim', module = 'plenary'}
        use{'lewis6991/impatient.nvim'}
        use{'tami5/sqlite.lua'}
        use{'windwp/nvim-autopairs',
                event = 'InsertEnter',
                config = function() require('nvim-autopairs').setup() end
        }
        use{'folke/which-key.nvim',
                module = 'which-key',
                config = function() require('editor.which-key') end
        }
        use{'Shatur/neovim-session-manager',
                cmd = 'SessionManager',
                event = 'BufWritePost',
                config = function() require('session_manager').setup() end
        }
-- }}}

-- {({ Language Server
        use{'neovim/nvim-lspconfig',
                after = 'nvim-cmp',
                event = { 'BufRead', 'BufNewFile', 'InsertEnter'},
                config = function() require('lsp.lspconfig') end
        }

        use{'hrsh7th/nvim-cmp',
                event = {'InsertEnter', 'CmdLineEnter'},
                requires = {
                        {'onsails/lspkind.nvim',
                                event = { 'InsertEnter', 'CmdLineEnter'},
                                module = 'lspkind'
                        }
                },
                config = function() require('lsp.cmp') end
        }
        use{'hrsh7th/cmp-nvim-lsp', module = 'cmp_nvim_lsp'}
        use{'hrsh7th/cmp-buffer', after = 'nvim-cmp'}
        use{'hrsh7th/cmp-path', after = 'nvim-cmp'}
        use{'hrsh7th/cmp-cmdline', after = 'nvim-cmp'}
        use{'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'}
        use{'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'}
        use{'glepnir/lspsaga.nvim',
                branch = 'main',
                after = 'nvim-lspconfig',
                config = function() require('lsp.lspsaga') end
        }
        use{'L3MON4D3/LuaSnip',
                after = 'nvim-cmp',
                requires = {'rafamadriz/friendly-snippets', opt = true}
        }
        use{'danymat/neogen', ft = treesitter_filetypes}
        use{'nvim-neotest/neotest'}
-- }}}

-- {{{ Language Specific
        use{'Saecki/crates.nvim',
                event = "BufRead Cargo.toml",
                config = function() require('crates').setup() end
        }
        use{'ixru/nvim-markdown', ft = 'markdown'}
-- }}}

-- {{{ Aesthetics
        use{'Pocco81/true-zen.nvim',
                opt = true,
                cmd = {
                        'TZAtaraxis',
                        'TZFocus',
                        'TZMinimalist',
                        'TZNarrow'
                },
                config = function() require('accessories.true-zen') end
        }
        use{'NTBBloodbath/galaxyline.nvim',
                config = function() require('ui.galaxyline') end
        }
        use{'nanozuki/tabby.nvim',
                config = function() require('ui.tabby') end
        }
        use{'kyazdani42/nvim-web-devicons'}
        -- use{'glepnir/dashboard-nvim'}
        use{'goolord/alpha-nvim',
                config = function() require('ui.alpha-nvim') end
        }
        use{'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate',
                event = 'BufRead',
                config = function() require('editor.nvim-treesitter') end
        }
        use{'lukas-reineke/headlines.nvim',
                ft = { 'markdown', 'org', 'neorg' },
                config = function() require('accessories.headlines') end
        }
        use{'stevearc/dressing.nvim'}
        use{'lewis6991/gitsigns.nvim',
                event = 'BufEnter',
                config = function() require('gitsigns').setup() end
        }
-- }}}
-- {{{ Colorschemes
        use{'shaunsingh/nord.nvim'}
        use{'shaunsingh/oxocarbon.nvim', run = 'CARGO_TARGET_DIR=./target ./install.sh', opt = true}
        use{'embark-theme/vim', as = 'embark', opt = true}
        use{'EdenEast/nightfox.nvim', opt = true}
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
                threshold = 1
        }
}})
