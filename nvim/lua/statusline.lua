
S = {}
local colors = require('highlights').colors

local vim_modes = setmetatable(
    {
            n      = { text = ' NOR ',  hl = "%#StatusViNormal#" },
            no     = { text = ' NOR ',  hl = "%#StatusViNormal#" },
            nt     = { text = ' NOR ',  hl = "%#StatusViNormal#" },
            ntT    = { text = ' NOR ',  hl = "%#StatusViNormal#" },
            i      = { text = ' INS ',  hl = "%#StatusViInsert#" },
            ic     = { text = ' INS ',  hl = "%#StatusViInsert#" },
            c      = { text = ' COM ',  hl = "%#StatusViCommand#" },
            v      = { text = ' VIS ',  hl = "%#StatusViVisual#" },
            V      = { text = ' VLI ',  hl = "%#StatusViVisual#" },
            [''] = { text = ' VBL ',  hl = "%#StatusViVisual#" },
            s      = { text = ' SEL ',  hl = "%#StatusViSelect#" },
            S      = { text = ' SEL ',  hl = "%#StatusViSelect#" },
            R      = { text = ' RPL ',  hl = "%#StatusViSelect#" },
            ['r?'] = { text = ' RPL ',  hl = "%#StatusViSelect#" },
            Rv     = { text = ' RPL ',  hl = "%#StatusViSelect#" },
            r      = { text = ' RPL ',  hl = "%#StatusViSelect#" },
            rm     = { text = ' RPL ',  hl = "%#StatusViSelect#" },
            t      = { text = ' TRM ',  hl = "%#StatusViNormal#" },
            ['!']  = { text = ' SHL ',  hl = "%#StatusViOther#" },
            },
            { -- fallback function
                    __index = function()
                    return { text = ' UKN ', color = "%#StatusViOther#" }
                    end
            }
    )

function vim_mode_hl()
    return vim_modes[vim.api.nvim_get_mode().mode].hl
end

local status_norm_hl = "%#StatusLine#"
local status_norm_fill_hl = "%#StatusLineFill#"
local status_inactive_sep_hl = "%#StatusLineSepInactive#"

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
        return status_norm_hl .. " %f%m " .. status_inactive_sep_hl .. "%="
end

S.status_vim_mode = function ()
        local curr_mode = vim.api.nvim_get_mode().mode

        return vim_mode_hl() .. vim_modes[curr_mode].text
end

S.status_line_col = function ()
        local line_col = status_norm_hl .. ' %l:%c '
        local file_percent = status_norm_hl .. ' %P '

        return line_col .. file_percent
end

S.status_filename = function ()
        local filename = vim_mode_hl() .. ' ' .. vim.fn.expand("%:t") .. "%m "
        if filename == '' then return '' end

        return filename .. status_norm_fill_hl .. "%="
end

S.status_git_status = function ()
        local exists, fugitive = pcall(vim.fn["fugitive#statusline"])
        local git_branch = ""
        if exists then
            git_branch = string.match(fugitive, "%((%a+)%)")
        end

        return git_branch ~= nil and
            status_norm_hl .. ' ' .. git_branch .. ' '
            or ''
end

-- TODO: remove this section if get_diagnostic() fails
S.status_lsp_status = function ()
        return string.format(
                        " %%#DiagnosticSignInfo#%s%%* %%#DiagnosticSignWarn#%s%%* %%#DiagnosticSignError#%s%%* ",
                        S.get_diagnostic(vim.diagnostic.severity.INFO) or 0,
                        S.get_diagnostic(vim.diagnostic.severity.WARN) or 0,
                        S.get_diagnostic(vim.diagnostic.severity.ERROR) or 0
                )
end

S.get_diagnostic = function (severity)
        local active_clients = vim.lsp.get_clients({ bufnr = 0 })
        if next(active_clients) == nil then return '' end

        if active_clients then
                local diag_count = vim.diagnostic.get(vim.api.nvim_get_current_buf(), { severity = severity })
                if diag_count and #diag_count ~= 0 then return #diag_count end
        else
            return ''
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
