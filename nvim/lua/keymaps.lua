--[[

**keymap categories**

<leader>d -> diagnostics
<leader>f -> fuzzy finder
<leader>g -> git
<leader>l -> lsp
<leader>o -> overseer

t -> tabs
; -> panes/windows

--]]

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = ','

keymap('n', 'B', '^', { noremap = true })
keymap('n', 'W', '$', { noremap = true })
keymap('n', '^', '<nop>', { noremap = true })
keymap('n', '$', '<nop>', { noremap = true })

keymap('n', ";w", "<cmd>w<cr>", opts)
keymap('n', ";q", "<cmd>q<cr>", opts)

keymap('n', 'U', '<c-r>', { noremap = true })
keymap('n', 'K', '<c-u>', { noremap = true })
keymap('n', 'J', '<c-d>', { noremap = true })

keymap('n', '<S-cr>', "<cmd>put! =repeat(nr2char(10), v:count1)|silent ']+1<cr>", opts)
keymap('n', '<cr>', "<cmd>put =repeat(nr2char(10), v:count1)|silent '[-1<cr>", opts)

keymap('n', "zs", '<cmd>term zsh<cr>a', opts)
keymap('t', "<esc>", "<c-\\><c-n>", opts)
keymap('n', "<leader>g", "<cmd>Git<cr>", opts)

keymap('n', '-', "<cmd>lua require('oil').open_float()<cr>", opts)

-- fuzzy finder
keymap('n', "<leader>ff", "<cmd>FzfLua files<cr>", opts)
keymap('n', "<leader>fg", "<cmd>FzfLua grep<cr>", opts)
keymap('n', "<leader>fb", "<cmd>FzfLua buffers<cr>", opts)
keymap('n', "<leader>f/", "<cmd>FzfLua grep_curbuf<cr>", opts)
keymap('n', "<leader>fh", "<cmd>FzfLua help_tags<cr>", opts)

-- tabs
keymap('n', "ta", "<cmd>tabnew<cr>", opts)
keymap('n', "tc", "<cmd>tabclose<cr>", opts)
keymap('n', "tn", "gt", opts)
keymap('n', "tp", "gT", opts)

-- panes/windows
keymap('n', ";s", "<cmd>new<cr>", opts)
keymap('n', ";v", "<cmd>vnew<cr>", opts)
keymap('n', ";o", "<c-w>o", opts)

keymap('n', ";j", "<cmd>lua require('smart-splits').move_cursor_down()<cr>")
keymap('n', ";k", "<cmd>lua require('smart-splits').move_cursor_up()<cr>")
keymap('n', ";h", "<cmd>lua require('smart-splits').move_cursor_left()<cr>")
keymap('n', ";l", "<cmd>lua require('smart-splits').move_cursor_right()<cr>")

keymap('n', '<A-j>', "<cmd>lua require('smart-splits').resize_down()<cr>")
keymap('n', '<A-k>', "<cmd>lua require('smart-splits').resize_up()<cr>")
keymap('n', '<A-h>', "<cmd>lua require('smart-splits').resize_left()<cr>")
keymap('n', '<A-l>', "<cmd>lua require('smart-splits').resize_right()<cr>")

keymap('n', '<c-j>', "<cmd>lua require('smart-splits').swap_buf_down()<cr>")
keymap('n', '<c-k>', "<cmd>lua require('smart-splits').swap_buf_up()<cr>")
keymap('n', '<c-h>', "<cmd>lua require('smart-splits').swap_buf_left()<cr>")
keymap('n', '<c-l>', "<cmd>lua require('smart-splits').swap_buf_right()<cr>")

-- lsp
keymap('n', "<leader>lf", "<cmd>Lspsaga lsp_finder<cr>", opts)
keymap('n', "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", opts)

-- diagnostics
keymap('n', "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
keymap('n', "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
keymap('n', "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<cr>", opts)
keymap('n', "<leader>dn", "<cmd>Lspsaga dianostic_jump_next<cr>", opts)
keymap('n', "<leader>dp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap('n', "<leader>dN", "<cmd>lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>", opts)
keymap('n', "<leader>dP", "<cmd>lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>", opts)

-- overseer
keymap('n', "<leader>or", "<cmd>OverseerRun<cr>", opts)
keymap('n', "<leader>ot", "<cmd>OverseerToggle<cr>", opts)
