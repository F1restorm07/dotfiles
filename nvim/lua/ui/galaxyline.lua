local get = require('icons').get
local gl = require('galaxyline')
local colors = {
        -- Polar Night
        nord0 = "#2e3440", -- origin color
        nord1 = "#3b4252", -- nord0 bright
        nord2 = "#434c5e", -- nord0 bright 2
        nord3 = "#4c566a", -- nord0 bright 3
         -- Snow Storm
        nord4 = "#d8dee9", -- origin color
        nord5 = "#e5e9f0", -- nord4 bright
        nord6 = "#eceff4", -- nord4 bright 2
         -- Frost
        nord7 = "#8fbcbb", -- frozen polar waters
        nord8 = "#88c0d0", -- clear ice
        nord9 = "#81a1c1", -- arctic waters
        nord10 = "#5e81ac", -- arctic ocean
         -- Aurora
        nord11 = "#bf616a", -- red
        nord12 = "#d08770", -- orange
        nord13 = "#ebcb8b", -- yellow
        nord14 = "#a3be8c", -- green
        nord15 = "#b48ead", -- magenta
        bg = "#2e3440",
        fg = "#eceff4",
        }
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'*'}

local modes = setmetatable(
{
        n      = { text = ' NORMAL ',   color = colors.nord9 },
        no     = { text = ' NORMAL ',   color = colors.nord9 },
        i      = { text = ' INSERT ',   color = colors.nord15 },
        ic     = { text = ' INSERT ',   color = colors.nord15 },
        c      = { text = ' COMMAND ',  color = colors.nord12 },
        v      = { text = ' VISUAL ',   color = colors.nord11 },
        V      = { text = ' LINVIS ',   color = colors.nord11 },
        [""]   = { text = ' BLKVIS ',   color = colors.nord11 },
        s      = { text = ' SELECT ',   color = colors.nord13 },
        S      = { text = ' SELECT ',   color = colors.nord13 },
        ['']   = { text = ' SELECT ',   color = colors.nord13 },
        R      = { text = ' REPLACE ',  color = colors.nord14 },
        ['r?'] = { text = ' REPLACE ',  color = colors.nord14 },
        Rv     = { text = ' REPLACE ',  color = colors.nord14 },
        r      = { text = ' REPLACE ',  color = colors.nord14 },
        rm     = { text = ' REPLACE ',  color = colors.nord14 },
        t      = { text = ' TERMINAL ', color = colors.nord9 },
        ['!']  = { text = ' ! ',        color = colors.nord11 },
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
                                colors.bg,
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
        FileIcon = {
                provider = "FileIcon",
                condition = condition.buffer_not_empty,
                highlight = "GalaxyViMode",
        }
}

gls.left[6] = {
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
                separator_highlight = "GalaxyViModeReverse",
                highlight = "GalaxyViMode",
        }
}

gls.right[2] = {
        DiffAdd = {
                provider = "DiffAdd",
                icon = get("plus-circle") .. ' ',
                condition = condition.check_git_workspace,
                highlight = "GalaxyViMode",
        }
}

gls.right[3] = {
        DiffModified = {
                provider = "DiffModified",
                icon = get("issue-opened") .. ' ',
                condition = condition.check_git_workspace,
                highlight = "GalaxyViMode",
        }
}

gls.right[4] = {
        DiffRemove = {
                provider = "DiffRemove",
                icon = get("skip") .. ' ',
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
                separator = " ",
                separator_highlight = "GalaxyViModeReverse",
                highlight = "GalaxyViMode",
        }
}

gls.right[8] = {
        DiagnosticInfo = {
                provider = "DiagnosticInfo",
                icon = get("info") .. ' ',
                highlight = "GalaxyViMode",
        }
}

gls.right[9] = {
        DiagnosticHint = {
                provider = "DiagnosticHint",
                icon = get("question") .. ' ',
                highlight = "GalaxyViMode",
        }
}

gls.right[10] = {
        DiagnosticWarn = {
                provider = "DiagnosticWarn",
                icon = get("no-entry") .. ' ',
                 highlight = "GalaxyViMode",
        }
}

gls.right[11] = {
        DiagnosticError = {
                provider = "DiagnosticError",
                icon = get("x-circle") .. ' ',
                highlight = "GalaxyViMode",
        }
}

-----------------------------------------

gls.short_line_left[1] = {
        BufferType = {
                provider = "FileName",
                separator = "",
                separator_highlight = { colors.nord1, colors.bg },
                highlight = { colors.nord9, colors.nord1 },
                event = ""
        }
}
