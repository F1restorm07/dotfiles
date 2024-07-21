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
local opts = function(desc) return { noremap = true, silent = true, desc = desc or "" } end
vim.g.mapleader = ','

--  -------------------------------------------------------
--  {{{ Improved Defualt Mappings + Functions

-- easier end/start of line moving
keymap({'n', 'v'}, 'B', '^', { noremap = true, desc = "go to first character in line" })
keymap({'n', 'v'}, 'W', "g_", { noremap = true, desc = "go to last character in line" })
keymap({'n', 'v'}, '^', '<nop>', { noremap = true })
keymap({'n', 'v'}, '$', '<nop>', { noremap = true })

keymap('n', ";w", "<cmd>w<cr>", opts("write"))
keymap('n', ";q", "<cmd>q<cr>", opts("quit"))
keymap('i', "jk", "<esc>", opts("exit to normal mode"))
keymap({'n', 'v'}, 'E', "ge", { noremap = true, desc = "go to end of previous word" })
keymap({'n', 'v'}, 'ge', '<nop>', { noremap = true })

keymap('n', 'n', "n<cmd>lua=require('search_index').echohl_search_status()<cr>", opts("move to next search count"))
keymap('n', 'N', "N<cmd>lua=require('search_index').echohl_search_status()<cr>", opts("move to previous search count"))

-- continuous visual indenting
keymap('v', '<', "<gv", opts("outdent"))
keymap('v', '>', ">gv", opts("indent"))

keymap('i', "<s-tab>", "<esc><<i", { desc = "decrease indent level" })

keymap('n', 'U', '<c-r>', { noremap = true, desc = "redo" })
keymap('n', 'K', '<c-u>zz', { noremap = true, desc = "scroll up n lines, stay in center" })
keymap('n', 'J', '<c-d>zz', { noremap = true, desc = "scroll down n lines, stay in center" })

-- navigating the jumplist
keymap('n', 'H', '<c-o>', { noremap = true, desc = "travel up jumplist" })
keymap('n', 'L', '<c-i>', { noremap = true, desc = "travel down jumplist" })

-- insert newline before/after current line
keymap('n', '<S-cr>', "<cmd>put! =repeat(nr2char(10), v:count1)|silent ']+1<cr>", opts("add newline above"))
keymap('n', '<cr>', "<cmd>put =repeat(nr2char(10), v:count1)|silent '[-1<cr>", opts("add newline below"))

-- move line up or down
keymap('n', '<leader>k', "<cmd>move -2<cr>==", opts("swap line up"))
keymap('n', '<leader>j', "<cmd>move +<cr>==", opts("swap line down"))
keymap('v', '<leader>k', "<cmd>'<,'>move -2<cr>gv==gv", opts("swap lines up"))
keymap('v', '<leader>j', "<cmd>'<,'>move +<cr>gv==gv", opts("swap lines down"))

keymap('n', "zs", '<cmd>term zsh<cr>a', opts("open terminal"))
keymap('t', "<esc>", "<c-\\><c-n>", opts())

keymap('n', "<leader>g", "<cmd>Git<cr>", opts("open git"))

--  }}}
--  -------------------------------------------------------
--  {{{ Fuzzy Finder

keymap('n', "<leader>ff", "<cmd>FzfLua files<cr>", opts("open files"))
keymap('n', "<leader>fg", "<cmd>FzfLua grep<cr>", opts("fuzzy find across files"))

keymap('n', "<leader>fb", "<cmd>FzfLua buffers<cr>", opts("open buffers"))
keymap('n', "<leader>f/", "<cmd>FzfLua grep_curbuf<cr>", opts("fuzzy find in current buffer"))
keymap('n', "<leader>fh", "<cmd>FzfLua help_tags<cr>", opts("open help files"))

--  }}}
--  -------------------------------------------------------
--  {{{ Crates.nvim

keymap('n', "<leader>cf", "<cmd>lua require('crates').show_features_popup()<cr>", opts("show crate features"))
keymap('n', "<leader>cv", "<cmd>lua require('crates').show_versions_popup()<cr>", opts("show crate versions"))
keymap('n', "<leader>cd", "<cmd>lua require('crates').show_dependencies_popup()<cr>", opts("show crate dependencies"))

keymap('n', "<leader>cu", "<cmd>lua require('crates').update_crate()<cr>", opts("update crate"))
keymap('n', "<leader>cU", "<cmd>lua require('crates').update_all_crates()<cr>", opts("update all crates"))
keymap('v', "<leader>cu", "<cmd>lua require('crates').update_crates()<cr>", opts("update crates"))

--  }}}
--  -------------------------------------------------------
--  {{{ Tabs + Windows

-- tabs
keymap('n', "ta", "<cmd>tabnew<cr>", opts("new tab"))
keymap('n', "tc", "<cmd>tabclose<cr>", opts("close tab"))
keymap('n', "tn", "gt", opts("next tab"))
keymap('n', "tp", "gT", opts("prev tab"))

-- windows
keymap('n', ";s", "<cmd>new<cr>", opts("split window horizontally"))
keymap('n', ";v", "<cmd>vnew<cr>", opts("split window vertically"))
keymap('n', ";o", "<c-w>o", opts("close all other windows except current one"))

keymap('n', ";j", "<c-w>j", opts("move down window"))
keymap('n', ";k", "<c-w>k", opts("move up window"))
keymap('n', ";h", "<c-w>h", opts("move left window"))
keymap('n', ";l", "<c-w>l", opts("move right window"))

keymap('n', "]w", "<c-w>w", opts("move to the next window"))
keymap('n', "[w", "<c-w>W", opts("move to the previous window"))

keymap('n', '<A-j>', "<c-w>+", opts("shrink horizonal split"))
keymap('n', '<A-k>', "<c-w>-", opts("grow vertical split"))
keymap('n', '<A-h>', "<c-w><", opts("shrink vertical split"))
keymap('n', '<A-l>', "<c-w>>", opts("grow vertical split"))

keymap('n', ';J', "<cmd>WinShift down<cr>", opts("swap window down"))
keymap('n', ';K', "<cmd>WinShift up<cr>", opts("swap window up"))
keymap('n', ';H', "<cmd>WinShift left<cr>", opts("swap window left"))
keymap('n', ';L', "<cmd>WinShift right<cr>", opts("swap window right"))

--  }}}
--  -------------------------------------------------------
--  {{{ Lsp + Diagnostics

-- lsp
keymap('n', "<leader>lf", "<cmd>FzfLua lsp_finder<cr>", opts("lsp definitions and references"))
keymap('n', "<leader>ld", "<cmd>FzfLua lsp_definitions<cr>", opts("lsp definitions"))
keymap('n', "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts("hover documentation"))
keymap('n', "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts("rename ident"))

-- diagnostics
keymap('n', "<leader>db", "<cmd>FzfLua diagnostics_document<cr>", opts("buffer diagnostics"))
keymap('n', "<leader>dl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts("line diagnostics"))
keymap('n', "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts("next diagnostic"))
keymap('n', "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts("prev diagnostic"))
keymap('n', "]D", "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>", opts("next error diagnostic"))
keymap('n', "[D", "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>", opts("prev error diagnostic"))

--  }}}
--  -------------------------------------------------------
