--[[

**keymap categories**

<leader>f -> fuzzy finder
<leader>g -> git
<leader>d -> diagnostics
<leader>l -> lsp
<leader>c -> crates.nvim

t -> tabs
; -> panes/windows/common `:` commands

--]]

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = ','

--  -------------------------------------------------------
--  {{{ Improved Defualt Mappings + Functions
-- easier end/start of line moving
keymap({'n', 'v'}, 'B', '^', { noremap = true })
keymap({'n', 'v'}, 'W', "g_", { noremap = true })
keymap({'n', 'v'}, '^', '<nop>', { noremap = true })
keymap({'n', 'v'}, '$', '<nop>', { noremap = true })

keymap('n', ";w", "<cmd>w<cr>", opts)
keymap('n', ";q", "<cmd>q<cr>", opts)
keymap('i', "jk", "<esc>", opts) -- faster insert mode escape

-- continuous visual indenting
keymap('v', '<', "<gv", opts)
keymap('v', '>', ">gv", opts)

keymap('i', "<s-tab>", "<esc><<i") -- decrease indent level

keymap('n', 'U', '<c-r>', { noremap = true }) -- redo
keymap('n', 'K', '<c-u>', { noremap = true }) -- scroll up n lines
keymap('n', 'J', '<c-d>', { noremap = true }) -- scroll down n lines

-- navigating the jumplist
keymap('n', 'H', '<c-o>', { noremap = true })
keymap('n', 'L', '<c-i>', { noremap = true })

-- insert newline before/after current line
keymap('n', '<S-cr>', "<cmd>put! =repeat(nr2char(10), v:count1)|silent ']+1<cr>", opts)
keymap('n', '<cr>', "<cmd>put =repeat(nr2char(10), v:count1)|silent '[-1<cr>", opts)

-- move line up or down
keymap('n', '<leader>j', "<cmd>move -2<cr>==", opts)
keymap('n', '<leader>k', "<cmd>move +<cr>==", opts)
keymap('v', '<leader>j', "<cmd>'<,'>move -2<cr>gv==gv", opts) -- reenter visual mode after move
keymap('v', '<leader>k', "<cmd>'<,'>move +<cr>gv==gv", opts)

keymap('n', "zs", '<cmd>term zsh<cr>a', opts)
keymap('t', "<esc>", "<c-\\><c-n>", opts)

keymap('n', "<leader>g", "<cmd>Git<cr>", opts)

--  }}}
--  -------------------------------------------------------
--  {{{ Fuzzy Finder

keymap('n', "<leader>ff", "<cmd>FzfLua files<cr>", opts)
keymap('n', "<leader>fg", "<cmd>FzfLua grep<cr>", opts)
keymap('n', "<leader>fb", "<cmd>FzfLua buffers<cr>", opts)
keymap('n', "<leader>f/", "<cmd>FzfLua grep_curbuf<cr>", opts)
keymap('n', "<leader>fh", "<cmd>FzfLua help_tags<cr>", opts)

--  }}}
--  -------------------------------------------------------
--  {{{ Crates.nvim

keymap('n', "<leader>cf", "<cmd>lua require('crates').show_features_popup()<cr>", opts)
keymap('n', "<leader>cv", "<cmd>lua require('crates').show_versions_popup()<cr>", opts)
keymap('n', "<leader>cd", "<cmd>lua require('crates').show_dependencies_popup()<cr>", opts)

keymap('n', "<leader>cu", "<cmd>lua require('crates').update_crate()<cr>", opts)
keymap('n', "<leader>cU", "<cmd>lua require('crates').update_all_crates()<cr>", opts)
keymap('v', "<leader>cu", "<cmd>lua require('crates').update_crates()<cr>", opts)

--  }}}
--  -------------------------------------------------------
--  {{{ Tabs + Windows

-- tabs
keymap('n', "ta", "<cmd>tabnew<cr>", opts)
keymap('n', "tc", "<cmd>tabclose<cr>", opts)
keymap('n', "tn", "gt", opts)
keymap('n', "tp", "gT", opts)

-- windows
keymap('n', ";s", "<cmd>new<cr>", opts)
keymap('n', ";v", "<cmd>vnew<cr>", opts)
keymap('n', ";o", "<c-w>o", opts) -- close all other windows except current one
-- keymap('n', ";d", "<cmd>call delete(@%) | bdelete!<cr>") -- deletes current buffer and associated file

keymap('n', ";j", "<c-w>j")
keymap('n', ";k", "<c-w>k")
keymap('n', ";h", "<c-w>h")
keymap('n', ";l", "<c-w>l")

keymap('n', '<A-j>', "<c-w>+")
keymap('n', '<A-k>', "<c-w>-")
keymap('n', '<A-h>', "<c-w><")
keymap('n', '<A-l>', "<c-w>>")

keymap('n', ';J', "<cmd>WinShift down<cr>")
keymap('n', ';K', "<cmd>WinShift up<cr>")
keymap('n', ';H', "<cmd>WinShift left<cr>")
keymap('n', ';L', "<cmd>WinShift right<cr>")

--  }}}
--  -------------------------------------------------------
--  {{{ Lsp + Diagnostics

-- lsp
keymap('n', "<leader>lf", "<cmd>FzfLua lsp_finder<cr>", opts) -- definitions and references
keymap('n', "<leader>ld", "<cmd>FzfLua lsp_definitions<cr>", opts)
keymap('n', "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
keymap('n', "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- diagnostics
keymap('n', "<leader>db", "<cmd>FzfLua diagnostics_document<cr>", opts)
keymap('n', "<leader>dl", "<cmd>lua vim.lsp.diagnostic.get_line_diagnostics()<cr>", opts)
keymap('n', "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
keymap('n', "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
keymap('n', "<leader>dN", "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>", opts)
keymap('n', "<leader>dP", "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>", opts)

--  }}}
--  -------------------------------------------------------
