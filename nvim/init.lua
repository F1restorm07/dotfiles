-- {{{ System Config

vim.loader.enable()

local set = vim.opt
local g = vim.g

set.visualbell = true
set.ruler = true
set.number = true

set.mouse = 'a'
set.confirm = true

set.softtabstop = 4
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

set.completeopt = "menu,menuone,noselect"

set.hidden = true
set.cmdheight = 2
set.showtabline = 2
set.conceallevel = 2
set.updatetime = 300
set.shortmess = "filnxtToOFcsI"
set.formatoptions = "jrql"
set.sessionoptions = "blank,curdir,folds,help,winsize,winpos,terminal,tabpages"
set.signcolumn = "yes"

--  }}}
--  -------------------------------------------------------
--  {{{ Variables

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

g.did_load_ftplugin = 1
g.did_ftplugin = 1

g.loaded_tutor_mode_plugin = 1

g.loaded_zipPlugin = 1
g.loaded_gzip = 1
g.loaded_tarPlugin = 1

g.loaded_matchit = 1
g.loaded_matchparen = 1

g.loaded_2html_plugin = 1
g.loaded_remote_plugins = 1
g.loaded_compiler = 1
g.loaded_man = 1

--  }}}
--  -------------------------------------------------------
--  {{{ Plugin Setup Commands

set.rtp:prepend(vim.fn.stdpath('data') .. '/lazy/lazy.nvim')
require('plugins')

set.termguicolors = true
set.guifont = 'JetBrainsMono Nerd Font Mono:h13'
vim.cmd.colorscheme('nordic')

require('highlights')
require('keymaps')

--  }}}
--  -------------------------------------------------------
--  {{{ Autocommands

vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_augroup("alphanvim", { clear = true })

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
                vim.opt_local.winbar = nil 
                vim.opt.showtabline = 0
                vim.opt.cmdheight = 0
        end,
        group = "alphanvim"
        }
)
vim.api.nvim_create_autocmd(
        "BufUnload",
        { buffer = 0, callback = function()
                vim.go.laststatus = 2
                vim.opt.showtabline = 2
                vim.opt.cmdheight = 1
        end,
        group = "alphanvim"
        }
)
