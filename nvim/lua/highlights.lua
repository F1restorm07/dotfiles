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

-- Nvim-cmp
highlight("PmenuSel", { bg=H.colors.nord8 , fg=H.colors.bg })
highlight("Pmenu", { bg=H.colors.nord0, fg=H.colors.nord4 })

highlight("CmpItemAbbrDeprecated", { fg=H.colors.nord3, strikethrough=true })
highlight("CmpItemAbbrMatch", { fg=H.colors.nord7, bold=true })
highlight("CmpItemAbbrMatchFuzzy", { fg=H.colors.nord7, bold=true })
highlight("CmpItemMenu", { fg=H.colors.nord4, italic=true })

highlight("CmpItemKindField", { bg=H.colors.nord11, fg=H.colors.bg })
highlight("CmpItemKindProperty", { bg=H.colors.nord11, fg=H.colors.bg })
highlight("CmpItemKindEvent", { bg=H.colors.nord11, fg=H.colors.bg  })

highlight("CmpItemKindText", { bg=H.colors.nord7, fg=H.colors.bg })
highlight("CmpItemKindEnum", { bg=H.colors.nord7, fg=H.colors.bg })
highlight("CmpItemKindKeyword", { bg=H.colors.nord7, fg=H.colors.bg })

highlight("CmpItemKindConstant", { bg=H.colors.nord10, fg=H.colors.bg })
highlight("CmpItemKindConstructor", { bg=H.colors.nord10, fg=H.colors.bg })
highlight("CmpItemKindReference", { bg=H.colors.nord10, fg=H.colors.bg })

highlight("CmpItemKindFunction", { bg=H.colors.nord15, fg=H.colors.bg })
highlight("CmpItemKindStruct", { bg=H.colors.nord15, fg=H.colors.bg })
highlight("CmpItemKindClass", { bg=H.colors.nord15, fg=H.colors.bg })
highlight("CmpItemKindModule", { bg=H.colors.nord15, fg=H.colors.bg })
highlight("CmpItemKindOperator", { bg=H.colors.nord15, fg=H.colors.bg })

highlight("CmpItemKindVariable", { bg=H.colors.nord3, fg=H.colors.fg })
highlight("CmpItemKindFile", { bg=H.colors.nord3, fg=H.colors.fg })

highlight("CmpItemKindUnit", { bg=H.colors.nord12, fg=H.colors.bg })
highlight("CmpItemKindSnippet", { bg=H.colors.nord12, fg=H.colors.bg })
highlight("CmpItemKindFolder", { bg=H.colors.nord12, fg=H.colors.bg })

highlight("CmpItemKindMethod", { bg=H.colors.nord9, fg=H.colors.bg })
highlight("CmpItemKindValue", { bg=H.colors.nord9, fg=H.colors.bg })
highlight("CmpItemKindEnumMember", { bg=H.colors.nord9, fg=H.colors.bg })

highlight("CmpItemKindInterface", { bg=H.colors.nord8, fg=H.colors.bg })
highlight("CmpItemKindColor", { bg=H.colors.nord8, fg=H.colors.bg })
highlight("CmpItemKindTypeParameter", { bg=H.colors.nord8, fg=H.colors.bg })

-- Alpha
highlight("AlphaHeader", { fg=H.colors.nord9 })
highlight("AlphaButton", { fg=H.colors.nord8 })
highlight("AlphaFooter", { fg=H.colors.nord9 })

-- Lspsaga
highlight("SagaBorder", { bg=H.colors.nord0 })
highlight("TitleString", { bg=H.colors.nord14, fg=H.colors.bg, bold=true })
highlight("TitleSymbol", { bg=H.colors.bg, fg=H.colors.nord14 })
highlight("TitleIcon", { bg=H.colors.nord14, fg=H.colors.bg })
highlight("TitleFileIcon", { bg=H.colors.nord14, fg=H.colors.bg })


return H
