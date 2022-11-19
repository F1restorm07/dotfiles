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
-- set.wildoptions += "pum"

set.lazyredraw = true

set.showmatch = true
set.incsearch = true

set.foldenable = true
set.foldlevelstart = 10
set.foldnestmax = 10
set.foldmethod = "marker"

set.swapfile = false
set.backup = false
set.undofile = true

set.colorcolumn = "100"
set.completeopt = "menu,menuone,noselect"

set.hidden = true
set.cmdheight = 2
set.updatetime = 300
set.shortmess = "filnxtToOFc"
set.signcolumn = "yes"

--  }}}
--  -------------------------------------------------------
--  {{{ System Mappings

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

keymap('n', 'B', '^', { noremap = true })
keymap('n', 'E', '$', { noremap = true })
keymap('v', 'B', '^', { noremap = true })
keymap('v', 'E', '$', { noremap = true })

keymap('n', '^', '<nop>', { noremap = true })
keymap('n', '$', '<nop>', { noremap = true })
keymap('v', '^', '<nop>', { noremap = true })
keymap('v', '$', '<nop>', { noremap = true })

keymap('n', "gV", "`[v`]", { noremap = true })

keymap('n', "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap('n', "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap('n', "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap('n', "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

keymap('n', "zs", "<cmd>term zsh<cr>a", opts)
keymap('n', "<leader>g", "<cmd>Neogit kind=vsplit", opts)

keymap('n', "ta", "<cmd>tabnew<cr>", opts)
keymap('n', "tc", "<cmd>tabclose<cr>", opts)
keymap('n', "tn", "<cmd>tabn<cr>", opts)
keymap('n', "tp", "<cmd>tabp<cr>", opts)

keymap('n', '-', "<cmd>lua require('lir.float').init()<cr>", opts)

keymap('n', "<leader>zn", "<cmd>TZNarrow<cr>", opts)
keymap('v', "<leader>zn", "<cmd>'<,'>TZNarrow<cr>", opts)
keymap('n', "<leader>zf", "<cmd>TZFocus<cr>", opts)
keymap('n', "<leader>zm", "<cmd>TZMinimalist<cr>", opts)
keymap('n', "<leader>za", "<cmd>TZAtaraxis<cr>", opts)

keymap('n', "gh", "<cmd>Lspsaga lsp_finder<cr>")

keymap('n', "<leader>ca", "<cmd>Lspsaga code_action<cr>")
keymap('v', "<leader>ca", "<cmd>Lspsaga range_code_action<cr>")

keymap('n', "gr", "<cmd>Lspsaga raname<cr>")
keymap('n', "gd", "<cmd>Lspsaga preview_definition<cr>")

keymap('n', "[d", "<cmd>Lspsaga dianostic_jump_next<cr>")
keymap('n', "]d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")

keymap('n', "[D", "<cmd>lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>")
keymap('n', "]D", "<cmd>lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>")

keymap('n', "<leader>o", "<cmd>LSoutlineToggle<cr>")
keymap('n', "K", "<cmd>Lspsaga hover_doc<cr>")

keymap('n', "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>")
keymap('n', "gh", "<cmd>Lspsaga show_cursor_diagnostics<cr>")

--  }}}
--  -------------------------------------------------------
--  {{{ Plugin Setup Commands

vim.notify = require('notify')

set.termguicolors = true
vim.cmd.colorscheme('nord')
set.background = "dark"

vim.cmd[[ runtime! lua/**.lua ]]

--  }}}
--  -------------------------------------------------------
--  {{{ Variables


set.sessionoptions:append { "winpos,terminal,folds" }
-- set.formatoptions:gsub ("co", '')

--  }}}
--  -------------------------------------------------------
--  {{{ Functions

-- local function trim_whitespace()
--         local save = winsaveview()
--         vim.cmd[[ %s/\\\@<!\s\+$//e]]
--         winrestview(save)
-- end


--  }}}
--  -------------------------------------------------------
--  {{{ Autocommands

vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_augroup("alpha-nvim", { clear = true })

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
        group = "alpha-nvim"
        }
)
vim.api.nvim_create_autocmd(
        "BufUnload",
        { buffer = 0, callback = function()
                vim.go.laststatus = 2
                vim.opt.showtabline = 2
                vim.opt.cmdheight = 1
        end,
        group = "alpha-nvim"
        }
)

vim.cmd[[ autocmd BufRead,BufNewFile *.wgsl set filetype=wgsl ]]

--  }}}
--  -------------------------------------------------------
--  {{{ Misc Lua Configs

vim.g.override_nvim_web_devicons = true
