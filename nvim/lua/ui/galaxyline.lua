local get = require('icons').get
local gl = require('galaxyline')
local colors = require('highlights').colors
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'*'}

local modes = setmetatable(
{
        n      = { text = ' NORMAL ',   color = colors.nord9 },
        no     = { text = ' NORMAL ',   color = colors.nord9 },
        nt     = { text = ' NORMAL ',   color = colors.nord9 },
        ntT    = { text = ' NORMAL ',   color = colors.nord9 },
        i      = { text = ' INSERT ',   color = colors.nord15 },
        ic     = { text = ' INSERT ',   color = colors.nord15 },
        c      = { text = ' COMMAND ',  color = colors.nord12 },
        v      = { text = ' VISUAL ',   color = colors.nord7 },
        V      = { text = ' LINVIS ',   color = colors.nord7 },
        [''] = { text = ' BLKVIS ',   color = colors.nord7 },
        s      = { text = ' SELECT ',   color = colors.nord13 },
        S      = { text = ' SELECT ',   color = colors.nord13 },
        R      = { text = ' REPLACE ',  color = colors.nord14 },
        ['r?'] = { text = ' REPLACE ',  color = colors.nord14 },
        Rv     = { text = ' REPLACE ',  color = colors.nord14 },
        r      = { text = ' REPLACE ',  color = colors.nord14 },
        rm     = { text = ' REPLACE ',  color = colors.nord14 },
        t      = { text = ' TERMINAL ', color = colors.nord9 },
        ['!']  = { text = ' SHELL ',    color = colors.nord11 },
        },
        { -- fallback function
                __index = function()
                return { text = ' UNKNOWN ', color = colors.nord11 }
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
                                colors.nord1
                        ))
                        vim.cmd(string.format("hi GalaxyViModeReverseBg guibg=%s guifg=%s",
                                colors.nord0,
                                modes[curr_mode].color
                        ))
                        vim.cmd(string.format("hi GalaxyViModeReverse guibg=%s guifg=%s",
                                colors.nord1,
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
                highlight = { colors.nord9, colors.nord1 },
        }
}

gls.left[3] = {
        PerCent = {
                provider = "LinePercent",
                highlight = { colors.nord9, colors.nord1 },
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
        WhiteSpace = {
                provider = function() return "" end,
                condition = condition.check_git_workspace,
                separator = "",
                separator_highlight = "GalaxyViModeReverseBg",
                highlight = "GalaxyViMode",
        }
}

gls.right[2] = {
        DiffAdd = {
                provider = "DiffAdd",
                icon = "" .. ' ',
                condition = condition.check_git_workspace,
                highlight = "GalaxyViMode",
        }
}

gls.right[3] = {
        DiffModified = {
                provider = "DiffModified",
                icon = "" .. ' ',
                condition = condition.check_git_workspace,
                highlight = "GalaxyViMode",
        }
}

gls.right[4] = {
        DiffRemove = {
                provider = "DiffRemove",
                icon = "" .. ' ',
                condition = condition.check_git_workspace,
                highlight = "GalaxyViMode",
        }
}

gls.right[5] = {
        WhiteSpace = {
                provider = function() return "" end,
                condition = condition.check_git_workspace,
                separator = " ",
                separator_highlight = "GalaxyViModeReverse",
                highlight = "GalaxyViMode",
        }
}

gls.right[6] = {
        GitBranch = {
                provider = "GitBranch",
                condition = condition.check_git_workspace,
                highlight = { colors.nord9, colors.nord1 },
        }
}

gls.right[7] = {
        WhiteSpace = {
                provider = function() return " " end,
                condition = condition.check_git_workspace,
                separator = " ",
                separator_highlight = "GalaxyViModeReverse",
                highlight = "GalaxyViMode",
        }
}

gls.right[8] = {
        DiagnosticInfo = {
                provider = "DiagnosticInfo",
                icon = "" .. ' ',
                highlight = "GalaxyViMode",
        }
}

gls.right[9] = {
        DiagnosticHint = {
                provider = "DiagnosticHint",
                icon = "" .. ' ',
                highlight = "GalaxyViMode",
        }
}

gls.right[10] = {
        DiagnosticWarn = {
                provider = "DiagnosticWarn",
                icon = "" .. ' ',
                 highlight = "GalaxyViMode",
        }
}

gls.right[11] = {
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
                separator_highlight = { colors.nord1, colors.nord0 },
                highlight = { colors.nord9, colors.nord1 },
                event = ""
        }
}
