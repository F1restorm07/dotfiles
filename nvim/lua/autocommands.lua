local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local lsp = require("lsp")

-- {{{ Autocommand Groups

augroup("numbertoggle", { clear = true })
augroup("alphanvim", { clear = true })
augroup("UserLspStart", { clear = true })
augroup("UserLspAttach", { clear = false })

-- }}}
--  -------------------------------------------------------

-- numbertoggle
aucmd(
        { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
        { pattern = "*", command = "if &nu && mode() != 'i' | set rnu | endif", group = "numbertoggle" }
)
aucmd(
        { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
        { pattern = "*", command = "if &nu | set nornu | endif", group = "numbertoggle" }
)

-- alphanvim
aucmd("User", {
        pattern = "AlphaReady", callback = function()
                vim.go.laststatus = 0
                vim.opt_local.winbar = nil
                vim.opt.showtabline = 0
                vim.opt.cmdheight = 0
        end,
        group = "alphanvim"
})
aucmd("BufUnload", {
        buffer = 0,
        callback = function()
                vim.go.laststatus = 2
                vim.opt.showtabline = 2
                vim.opt.cmdheight = 1
                vim.cmd.redrawtabline()
                vim.cmd.redrawstatus()
        end,
        group = "alphanvim"
})

--  -------------------------------------------------------
-- LSP

-- aucmd("InsertEnter", { pattern = "*", command = "LspStart" })
-- aucmd("LspAttach", { callback = function() require("lsp").lsp_hover.setup() end })

--  -------------------------------------------------------

aucmd("BufWritePre", { -- create missing directories on file save
        pattern = "*",
        callback = function()
                local dir = vim.fn.expand("<afile>:p:h")
                if vim.fn.isdirectory(dir) == 0 then -- check whether path is directory + it exists
                        vim.fn.mkdir(dir, 'p')
                end
        end
})
aucmd("BufWritePre", { -- remove trailing whitespace on save
        pattern = "*",
        callback = function()
                local pos = vim.api.nvim_win_get_cursor(0)

                vim.cmd [[:keepjumps keeppatterns %s_\s\+$__e]]
                vim.cmd [[:keepjumps keeppatterns silent! 0;_^\%(\n*.\)\@!_,$d_]]

                local rows = vim.api.nvim_buf_line_count(0)
                if pos[1] > rows then pos[1] = rows end
                vim.api.nvim_win_set_cursor(0, pos)
        end
})

aucmd("BufReadPost", { -- jump to the last known position in the file
        pattern = "*",
        callback = function()
                if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
                        vim.fn.setpos('.', vim.fn.getpos("'\""))
                        vim.api.nvim_feedkeys('zz', 'n', true)
                end
        end
})

 -- set formatoptions after ftplugin fires (ftplugin overrides formatoptions)
aucmd("FileType", {
        pattern = "*",
        command = "set fo=1jql"
})
aucmd("FileType", { -- start in insert mode
        pattern = { "gitcommit", "gitrebase" },
        command = "startinsert | 1"
})

 -- highlight on yank
aucmd("TextYankPost", {
        pattern = "*",
        callback = function() vim.highlight.on_yank({ timeout = 500 }) end
})

-- enable treesitter as the folding method
aucmd("FileType", {
    callback = function(args)
        if not pcall(vim.treesitter.start, args.buf) then
            vim.wo[0][0].foldmethod = "syntax"
            return
        end
        vim.api.nvim_buf_call(args.buf, function()
            vim.wo[0][0].foldmethod = "expr"
            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.cmd.normal('zx')
        end)
    end
})

-- update colorscheme
aucmd("OptionSet", {
    pattern = "background",
    callback = function()
        vim.cmd.luafile(vim.fn.stdpath("config") .. "/lua/highlights.lua")
        vim.cmd.luafile(vim.fn.stdpath("config") .. "/lua/statusline.lua")
    end
})

--  -------------------------------------------------------
--  filetype-specific commands
