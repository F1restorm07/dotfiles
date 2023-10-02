local get = require('icons').get
local gl = require('galaxyline')
local nord_colors = require('highlights').nord_colors
local palatte_colors = require('highlights').colors
local bg_color = palatte_colors.bg
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'*'}

local modes = setmetatable(
{
        n      = { text = ' NORMAL ',   color = nord_colors.nord9 },
        no     = { text = ' NORMAL ',   color = nord_colors.nord9 },
        nt     = { text = ' NORMAL ',   color = nord_colors.nord9 },
        ntT    = { text = ' NORMAL ',   color = nord_colors.nord9 },
        i      = { text = ' INSERT ',   color = nord_colors.nord15 },
        ic     = { text = ' INSERT ',   color = nord_colors.nord15 },
        c      = { text = ' COMMAND ',  color = nord_colors.nord12 },
        v      = { text = ' VISUAL ',   color = nord_colors.nord7 },
        V      = { text = ' LINVIS ',   color = nord_colors.nord7 },
        [''] = { text = ' BLKVIS ',   color = nord_colors.nord7 },
        s      = { text = ' SELECT ',   color = nord_colors.nord13 },
        S      = { text = ' SELECT ',   color = nord_colors.nord13 },
        R      = { text = ' REPLACE ',  color = nord_colors.nord14 },
        ['r?'] = { text = ' REPLACE ',  color = nord_colors.nord14 },
        Rv     = { text = ' REPLACE ',  color = nord_colors.nord14 },
        r      = { text = ' REPLACE ',  color = nord_colors.nord14 },
        rm     = { text = ' REPLACE ',  color = nord_colors.nord14 },
        t      = { text = ' TERMINAL ', color = nord_colors.nord9 },
        ['!']  = { text = ' SHELL ',    color = nord_colors.nord11 },
        },
        { -- fallback function
                __index = function()
                return { text = ' UNKNOWN ', color = nord_colors.nord11 }
                end
        }
)

-- {{{ Left Side

gls.left[1] = {
        ViMode = {
                provider = function()
                        local curr_mode = vim.api.nvim_get_mode().mode
                        vim.cmd(string.format("hi GalaxyViMode guibg=%s guifg=%s gui=bold",
                                modes[curr_mode].color,
                                nord_colors.nord1
                        ))
                        vim.cmd(string.format("hi GalaxyViModeReverseBg guibg=%s guifg=%s",
                                bg_color,
                                modes[curr_mode].color
                        ))
                        vim.cmd(string.format("hi GalaxyViModeReverse guibg=%s guifg=%s",
                                nord_colors.nord1,
                                modes[curr_mode].color
                        ))
                        return " " .. modes[curr_mode].text
                        end,
                separator = " ",
                separator_highlight = "GalaxyViModeReverse",
        },
}

gls.left[2] = {
        LineInfo = {
                provider = "LineColumn",
                separator = "",
                separator_highlight = "GalaxyViModeReverse",
                highlight = { nord_colors.nord9, nord_colors.nord1 },
        }
}

gls.left[3] = {
        PerCent = {
                provider = "LinePercent",
                highlight = { nord_colors.nord9, nord_colors.nord1 },
        },
}

gls.left[4] = {
        WhiteSpace = {
                provider = function() return "" end,
                condition = condition.buffer_not_empty,
                separator = "",
                separator_highlight = "GalaxyViModeReverse",
                highlight = "GalaxyViMode",
        }
}

gls.left[5] = {
        FileName = {
                provider = "FileName",
                condition = condition.buffer_not_empty,
                separator = "",
                separator_highlight = "GalaxyViModeReverseBg",
                highlight = "GalaxyViMode",
        }
}

-- }}}
----------------------------------------------------------
-- {{{ Right Side

gls.right[1] = {
        DiffAdd = {
                provider = "DiffAdd",
                icon = ' ' .. "" .. ' ',
                condition = condition.check_git_workspace,
                highlight = "GalaxyViMode",
                separator = "",
                separator_highlight = "GalaxyViModeReverseBg",
        }
}

gls.right[2] = {
        DiffModified = {
                provider = "DiffModified",
                icon = "" .. ' ',
                condition = condition.check_git_workspace,
                highlight = "GalaxyViMode",
        }
}

gls.right[3] = {
        DiffRemove = {
                provider = "DiffRemove",
                icon = "" .. ' ',
                condition = condition.check_git_workspace,
                highlight = "GalaxyViMode",
        }
}

gls.right[4] = {
        WhiteSpace = {
                provider = function() return "" end,
                condition = condition.check_git_workspace,
                separator = " ",
                separator_highlight = "GalaxyViModeReverse",
                highlight = "GalaxyViMode",
        }
}

gls.right[5] = {
        GitBranch = {
                provider = "GitBranch",
                condition = condition.check_git_workspace,
                highlight = { nord_colors.nord9, nord_colors.nord1 },
        }
}

gls.right[6] = {
        WhiteSpace = {
                provider = function() return " " end,
                condition = condition.check_active_lsp,
                separator = " ",
                separator_highlight = "GalaxyViModeReverse",
                highlight = "GalaxyViMode",
        }
}

gls.right[7] = {
        DiagnosticInfo = {
                provider = "DiagnosticInfo",
                icon = "" .. ' ',
                highlight = "GalaxyViMode",
        }
}

gls.right[8] = {
        DiagnosticHint = {
                provider = "DiagnosticHint",
                icon = "" .. ' ',
                highlight = "GalaxyViMode",
        }
}

gls.right[9] = {
        DiagnosticWarn = {
                provider = "DiagnosticWarn",
                icon = "" .. ' ',
                 highlight = "GalaxyViMode",
        }
}

gls.right[10] = {
        DiagnosticError = {
                provider = "DiagnosticError",
                icon = "" .. ' ',
                highlight = "GalaxyViMode",
        }
}

-----------------------------------------

gls.short_line_left[1] = {
        BufferType = {
                provider = "FileName",
                separator = "",
                separator_highlight = { nord_colors.nord1, bg_color },
                highlight = { nord_colors.nord9, nord_colors.nord1 },
                event = ""
        }
}
