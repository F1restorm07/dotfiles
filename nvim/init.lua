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

set.shiftwidth = 4 -- number of characters to (auto)indent
set.shiftround = true -- when using <</>>, it rounds to the nearest shiftwidth

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
set.fillchars = "fold: ,vert: "

set.swapfile = false
set.backup = false
set.undofile = true

set.completeopt = "menu,menuone,noselect"
set.wildoptions = "pum,fuzzy"
set.pumheight = 15

set.hidden = true
set.cmdheight = 2
set.showtabline = 2
set.conceallevel = 2

set.updatetime = 300
set.scrolloff = 3

set.shortmess = "atToOcCsSIFW"
set.sessionoptions = "blank,curdir,folds,help,winsize,winpos,terminal,tabpages"
set.signcolumn = "yes"

--  }}}
--  -------------------------------------------------------
--  {{{ Plugin Load Skips

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

require('keymaps') -- vim.g.mapleader is located in here (lazy.nvim needs it loaded before)

require('lazy').setup({
    {'folke/lazy.nvim', tag = 'stable', lazy = true},
    {'cocopon/iceberg.vim', lazy = true},
    {import = "plugins"}
})

set.termguicolors = true
set.guifont = 'JetBrainsMono Nerd Font Mono:h13'
vim.cmd.colorscheme('iceberg') -- set the colorscheme before highlights (sets the v.g.terminal_color_* used in highlights)

require('highlights')
require('autocommands')
require('tabline')
require('statusline')
require('search_index')
require('diagnostics')

--  }}}
--  -------------------------------------------------------

--[[
fun lua things to try
***
sequential vim marks (marking specific places in files, see https://vitalyparnas.com/guides/vim-sequential-marks/)
on the fly text evaluation (either fzf-lua/<cmd> or vim expression register [see https://vimtricks.com/p/vim-calculator/])
window swapping via marks (see https://vi.stackexchange.com/questions/3725/swap-the-position-of-two-windows)
--]]
