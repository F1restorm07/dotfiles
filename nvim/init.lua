-- {{{ System Config

vim.loader.enable()

local set = vim.opt
local g = vim.g

set.visualbell = true
set.ruler = false
set.number = true

set.mouse = 'nv'
set.confirm = true


set.softtabstop = 4
set.expandtab = true
set.smartindent = true
set.wrap = false

set.shiftwidth = 4 -- number of characters to (auto)indent
set.shiftround = true -- when using <</>>, it rounds to the nearest shiftwidth

set.showcmd = true
set.showmode = false
set.laststatus = 2

set.cursorline = true
set.wildmenu = true

set.showmatch = true
set.incsearch = true
set.hlsearch = false

set.foldenable = true
set.foldcolumn = "0"
set.foldlevelstart = 99
set.foldnestmax = 10
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

g.c_syntax_for_h = 1

if g.neovide then
    g.neovide_position_animation_length = 0
    g.neovide_cursor_animation_length = 0.00
    g.neovide_cursor_trail_size = 0
    g.neovide_cursor_animate_in_insert_mode = false
    g.neovide_cursor_animate_command_line = false
    g.neovide_scroll_animation_far_lines = 0
    g.neovide_scroll_animation_length = 0.00
    g.neovide_scale_factor = 1.25
    set.linespace = 10
end

-- vim.o.listchars = table.concat({ 'extends:…', 'nbsp:␣', 'precedes:…', 'tab:> ' }, ',')
-- set.list = true
-- set.listchars = {
--     tab = "· ",
--     nbsp = "+"
-- }

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
g.editorconfig = false

--  }}}
--  -------------------------------------------------------
--  {{{ Plugin Setup Commands

set.rtp:prepend(vim.fn.stdpath('data') .. '/lazy/lazy.nvim')
-- the fzf plugin needs to be manually activated (installed with fedora linux)
-- run the command `sudo ln -s /usr/share/nvim/site/plugin/fzf.vim /usr/share/nvim/runtime/plugin/fzf.vim`

require('keymaps') -- vim.g.mapleader is located in here (lazy.nvim needs it loaded before)

require('lazy').setup({
    {'folke/lazy.nvim', tag = 'stable', lazy = true},
    {'cocopon/iceberg.vim', lazy = true},
    {import = "plugins"}
})

set.termguicolors = true
set.background = "dark"
set.guifont = 'JetBrainsMono Nerd Font Mono:h13'
vim.cmd.colorscheme('iceberg') -- set the colorscheme before highlights (sets the v.g.terminal_color_* used in highlights)

require('lsp')
require('highlights')
require('autocommands')
require('tabline')
require('statusline')
require('search_index')
require('diagnostics')

vim.lsp.enable({ 'rust_analyzer', 'luals' })

--  }}}
--  -------------------------------------------------------

--[[
fun lua things to try
***
sequential vim marks (marking specific places in files, see https://vitalyparnas.com/guides/vim-sequential-marks/)
on the fly text evaluation (either fzf-lua/<cmd> or vim expression register [see https://vimtricks.com/p/vim-calculator/])
window swapping via marks (see https://vi.stackexchange.com/questions/3725/swap-the-position-of-two-windows)
--]]
