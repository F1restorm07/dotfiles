H = {}
H.colors = {
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

        bg = "#3b4252",
        fg = "#eceff4",
}

local function highlight(name, opts)
        vim.api.nvim_set_hl(0, name, opts)
end

-- Telescope
highlight("TelescopeBorder", { bg=H.colors.bg, fg=H.colors.bg })
highlight("TelescopePromptBorder", { bg=H.colors.nord2, fg=H.colors.nord2 })
highlight("TelescopePreviewBorder", { bg=H.colors.bg, fg=H.colors.bg })
highlight("TelescopeResultsBorder", { bg=H.colors.bg, fg=H.colors.bg })

highlight("TelescopePromptNormal", { bg=H.colors.nord2, fg=H.colors.nord4 })
highlight("TelescopePromptPrefix", { bg=H.colors.nord2, fg=H.colors.nord11 })

highlight("TelescopeNormal", { bg=H.colors.bg })
highlight("TelescopePreviewNormal", { bg=H.colors.bg })

highlight("TelescopePreviewTitle", { bg=H.colors.nord14, fg=H.colors.bg, bold=true })
highlight("TelescopePromptTitle", { bg=H.colors.nord11, fg=H.colors.bg, bold=true })
highlight("TelescopeResultsTitle", { bg=H.colors.nord9, fg=H.colors.bg, bold=true })
highlight("TelescopeSelection", { bg=H.colors.bg, fg=H.colors.nord9 })
highlight("TelescopeSelectionCaret", { bg=H.colors.bg, fg=H.colors.nord9 })
highlight("TelescopePreviewLine", { bg=H.colors.nord3 })

-- Nvim-cmp
highlight("PmenuSel", { bg=H.colors.nord8, fg=H.colors.bg, nocombine=true })
highlight("Pmenu", { bg=H.colors.nord0, fg=H.colors.nord4 })

highlight("CmpItemAbbrDeprecated", { fg=H.colors.nord3, strikethrough=true })
highlight("CmpItemAbbrMatch", { fg=H.colors.nord7, bold=true })
highlight("CmpItemAbbrMatchFuzzy", { fg=H.colors.nord7, bold=true })
highlight("CmpItemMenu", { fg=H.colors.nord4, italic=true })

highlight("CmpItemKindField", { bg=H.colors.nord11, fg=H.colors.nord4 })
highlight("CmpItemKindProperty", { bg=H.colors.nord11, fg=H.colors.nord4 })
highlight("CmpItemKindEvent", { bg=H.colors.nord11, fg=H.colors.nord4 })

highlight("CmpItemKindText", { bg=H.colors.nord7, fg=H.colors.nord4 })
highlight("CmpItemKindEnum", { bg=H.colors.nord7, fg=H.colors.nord4 })
highlight("CmpItemKindKeyword", { bg=H.colors.nord7, fg=H.colors.nord4 })

highlight("CmpItemKindConstant", { bg=H.colors.nord10, fg=H.colors.nord4 })
highlight("CmpItemKindConstructor", { bg=H.colors.nord10, fg=H.colors.nord4 })
highlight("CmpItemKindReference", { bg=H.colors.nord10, fg=H.colors.nord4 })

highlight("CmpItemKindFunction", { bg=H.colors.nord15, fg=H.colors.nord4 })
highlight("CmpItemKindStruct", { bg=H.colors.nord15, fg=H.colors.nord4 })
highlight("CmpItemKindClass", { bg=H.colors.nord15, fg=H.colors.nord4 })
highlight("CmpItemKindModule", { bg=H.colors.nord15, fg=H.colors.nord4 })
highlight("CmpItemKindOperator", { bg=H.colors.nord15, fg=H.colors.nord4 })

highlight("CmpItemKindVariable", { bg=H.colors.nord3, fg=H.colors.nord4 })
highlight("CmpItemKindFile", { bg=H.colors.nord3, fg=H.colors.nord4 })

highlight("CmpItemKindUnit", { bg=H.colors.nord12, fg=H.colors.nord4 })
highlight("CmpItemKindSnippet", { bg=H.colors.nord12, fg=H.colors.nord4 })
highlight("CmpItemKindFolder", { bg=H.colors.nord12, fg=H.colors.nord4 })

highlight("CmpItemKindMethod", { bg=H.colors.nord9, fg=H.colors.nord4 })
highlight("CmpItemKindValue", { bg=H.colors.nord9, fg=H.colors.nord4 })
highlight("CmpItemKindEnumMember", { bg=H.colors.nord9, fg=H.colors.nord4 })

highlight("CmpItemKindInterface", { bg=H.colors.nord8, fg=H.colors.nord4 })
highlight("CmpItemKindColor", { bg=H.colors.nord8, fg=H.colors.nord4 })
highlight("CmpItemKindTypeParameter", { bg=H.colors.nord8, fg=H.colors.nord4 })

-- Alpha
highlight("AlphaHeader", { fg=H.colors.nord9 })
highlight("AlphaButton", { fg=H.colors.nord8 })
highlight("AlphaFooter", { fg=H.colors.nord9 })

return H
