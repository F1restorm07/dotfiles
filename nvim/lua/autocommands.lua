local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- {{{ Autocommand Groups

-- TODO: add more augroups
augroup("numbertoggle", { clear = true })
augroup("alphanvim", { clear = true })

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

aucmd("InsertEnter", {
        pattern = "*",
        command = "LspStart",
})

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

aucmd("FileType", { -- set formatoptions after ftplugin fires (ftplugin overrides formatoptions)
        pattern = "*",
        command = "set fo=1jql"
})
aucmd("FileType", { -- start in insert mode
        pattern = { "gitcommit", "gitrebase" },
        command = "startinsert | 1"
})

aucmd("TextYankPost", { -- highlight on yank
        pattern = "*",
        callback = function() vim.highlight.on_yank({ timeout = 500 }) end
})

--  -------------------------------------------------------
--  filetype-specific commands

aucmd("FileType", { -- set the compiler option to cargo (allows for :make t, :make b, etc) (easier job dispatch)
    pattern = "rust",
    callback = function()
        vim.cmd [[:compiler cargo]]
        vim.b.dispatch = "cargo build -q --message-format=short" -- default dispatch command
    end
})
