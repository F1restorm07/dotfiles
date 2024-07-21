
S = {}
local colors = require('highlights').colors

local vim_modes = setmetatable(
{
        n      = { text = ' NORMAL ',   color = colors.blue },
        no     = { text = ' NORMAL ',   color = colors.blue },
        nt     = { text = ' NORMAL ',   color = colors.blue },
        ntT    = { text = ' NORMAL ',   color = colors.blue },
        i      = { text = ' INSERT ',   color = colors.purple },
        ic     = { text = ' INSERT ',   color = colors.purple },
        c      = { text = ' COMMAND ',  color = colors.orange },
        v      = { text = ' VISUAL ',   color = colors.aqua },
        V      = { text = ' LINVIS ',   color = colors.aqua },
        [''] = { text = ' BLKVIS ',   color = colors.aqua },
        s      = { text = ' SELECT ',   color = colors.green },
        S      = { text = ' SELECT ',   color = colors.green },
        R      = { text = ' REPLACE ',  color = colors.green },
        ['r?'] = { text = ' REPLACE ',  color = colors.green },
        Rv     = { text = ' REPLACE ',  color = colors.green },
        r      = { text = ' REPLACE ',  color = colors.green },
        rm     = { text = ' REPLACE ',  color = colors.green },
        t      = { text = ' TERMINAL ', color = colors.blue },
        ['!']  = { text = ' SHELL ',    color = colors.red },
        },
        { -- fallback function
                __index = function()
                return { text = ' UNKNOWN ', color = colors.red }
                end
        }
)

local vim_mode_hl = "%#StatusViMode#"
local vim_mode_invert_hl = "%#StatusViModeInvert#"
local vim_mode_invert_fill_hl = "%#StatusViModeInvertFill#"
local status_norm_hl = "%#StatusLine#"
local status_norm_fill_hl = "%#StatusLineFill#"
local status_inactive_sep_hl = "%#StatusLineSepInactive#"
S.theme = {
        vim_mode = vim_mode_hl,
        line_col = status_norm_hl,
        file_percent = status_norm_hl,
        filename = vim_mode_hl,
        git_status = vim_mode_hl,
        git_branch = status_norm_hl,
        lsp_status = vim_mode_hl,
}

function Status_active()
        return table.concat({
                S.status_vim_mode(),
                S.status_line_col(),
                S.status_filename(),
                "%=",
                S.status_git_status(),
                S.status_lsp_status(),
        })
end

function Status_inactive()
        -- %F --> filename (relative) // %m modified
        return status_norm_hl .. " %f%m " .. status_inactive_sep_hl .. '' .. "%="
end

S.status_vim_mode = function ()
        local curr_mode = vim.api.nvim_get_mode().mode

        vim.cmd(string.format("hi StatusViMode guibg=%s guifg=%s gui=bold",
                vim_modes[curr_mode].color,
                colors.bg
        ))
        vim.cmd(string.format("hi StatusViModeInvertFill guibg=%s guifg=%s",
                colors.status_fill,
                vim_modes[curr_mode].color
        ))
        vim.cmd(string.format("hi StatusViModeInvert guibg=%s guifg=%s",
                colors.bg,
                vim_modes[curr_mode].color
        ))

        return S.theme.vim_mode .. vim_modes[curr_mode].text .. vim_mode_invert_hl .. ''
end

S.status_line_col = function ()
        local line_col = S.theme.line_col .. ' %l:%c '
        local line_col_sep = vim_mode_invert_hl .. ''
        local file_percent = S.theme.file_percent .. ' %P '
        return line_col .. line_col_sep .. file_percent
end

S.status_filename = function ()
        local filename = S.theme.filename .. ' ' .. vim.fn.expand("%:t") .. "%m "
        if filename == '' then return '' end

        return vim_mode_invert_hl .. '' .. filename .. vim_mode_invert_fill_hl .. ''
end

S.status_git_status = function ()
        local git_signs = vim.b.gitsigns_status_dict or {head = '', added = 0, changed = 0, removed = 0}

        return git_signs.head ~= '' and
                vim_mode_invert_fill_hl .. '' ..
                S.theme.git_status .. string.format(
                        " +%s ~%s -%s ",
                        git_signs.added, git_signs.changed, git_signs.removed
                ) ..
                vim_mode_invert_hl .. '' ..
                S.theme.git_branch .. ' ' .. git_signs.head .. ' '
                or ''
end

S.status_lsp_status = function ()
        return vim_mode_invert_hl .. '' ..
                S.theme.lsp_status .. string.format(
                        " ?%s -%s x%s ",
                        S.get_diagnostic(vim.diagnostic.severity.INFO) or 0,
                        S.get_diagnostic(vim.diagnostic.severity.WARN) or 0,
                        S.get_diagnostic(vim.diagnostic.severity.ERROR) or 0
                )
end

S.get_diagnostic = function (severity)
        if next(vim.lsp.buf_get_clients(0)) == nil then return '' end
        local active_clients = vim.lsp.get_active_clients()

        if active_clients then
                local diag_count = vim.diagnostic.get(vim.api.nvim_get_current_buf(), { severity = severity })
                if diag_count and #diag_count ~= 0 then return #diag_count end
        end
end

-------------------------------------------------

Statusline = setmetatable(S,{
        __call = function(statusline, mode)
                return S["status_" .. mode](S)
        end
})

vim.api.nvim_create_augroup("Statusline", { clear = true })
vim.api.nvim_create_autocmd(
        { "WinEnter", "BufEnter" },
        {
                pattern = "*",
                command = "setlocal statusline=%!v:lua.Status_active()",
                group = "Statusline"
        }
)
vim.api.nvim_create_autocmd(
        { "WinLeave", "BufLeave" },
        {
                pattern = "*",
                command = "setlocal statusline=%!v:lua.Status_inactive()",
                group = "Statusline"
        }
)
