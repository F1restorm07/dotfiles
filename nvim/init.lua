-- {{{ System Config

require('impatient').enable_profile()

local set = vim.opt

set.visualbell = true
set.ruler = true
set.number = true

set.mouse = 'a'
set.confirm = true

set.softtabstop = 2
set.expandtab = true
set.smartindent = true
set.wrap = false

set.showcmd = true
set.laststatus = 2

set.cursorline = true
set.wildmenu = true

set.showmatch = true
set.incsearch = true
set.hlsearch = false

set.foldenable = true
set.foldlevelstart = 10
set.foldnestmax = 10
set.foldmethod = "marker"

set.swapfile = false
set.backup = false
set.undofile = true

-- set.colorcolumn = "100"
set.completeopt = "menu,menuone,noselect"

set.hidden = true
set.cmdheight = 2
set.showtabline = 2
set.conceallevel = 2
set.updatetime = 300
set.shortmess = "filnxtToOFc"
set.formatoptions = "jrql"
set.sessionoptions = "blank,curdir,folds,help,winsize,winpos,terminal,tabpages"
set.signcolumn = "yes"

--  }}}
--  -------------------------------------------------------
--  {{{ Plugin Setup Commands

set.termguicolors = true
set.guifont = 'JetBrainsMono Nerd Font Mono,nonicons:h13'
vim.cmd.colorscheme('nord')
vim.g.nord_borders = true

vim.cmd [[packadd packer.nvim]]
require('highlights')
require('keymaps')

--  }}}
--  -------------------------------------------------------
--  {{{ Variables

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_2html_plugin = 1

--  }}}
--  -------------------------------------------------------
--  {{{ Autocommands

vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_augroup("alpha_nvim", { clear = true })

-- numbertoggle
vim.api.nvim_create_autocmd(
        { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
        { pattern = "*", command = "if &nu && mode() != 'i' | set rnu | endif", group = "numbertoggle" }
)
vim.api.nvim_create_autocmd(
        { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
        { pattern = "*", command = "if &nu | set nornu | endif", group = "numbertoggle" }
)

vim.api.nvim_create_autocmd(
        "User",
        { pattern = "AlphaReady", callback = function()
                vim.go.laststatus = 0
                vim.opt.showtabline = 0
                vim.opt.cmdheight = 0
        end,
        group = "alpha_nvim"
        }
)
vim.api.nvim_create_autocmd(
        "BufUnload",
        { buffer = 0, callback = function()
                vim.go.laststatus = 2
                vim.opt.showtabline = 2
                vim.opt.cmdheight = 1
        end,
        group = "alpha_nvim"
        }
)
