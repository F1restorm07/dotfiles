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
highlight("PmenuSel", { bg=H.colors.nord8 , fg=H.colors.nord0 })
highlight("Pmenu", { bg=H.colors.nord0, fg=H.colors.nord4 })

highlight("CmpItemAbbrDeprecated", { fg=H.colors.nord3, strikethrough=true })
highlight("CmpItemAbbrMatch", { fg=H.colors.nord7, bold=true })
highlight("CmpItemAbbrMatchFuzzy", { fg=H.colors.nord7, bold=true })
highlight("CmpItemMenu", { fg=H.colors.nord4, italic=true })

highlight("CmpItemKindField", { fg=H.colors.nord11, bg=H.colors.nord0 })
highlight("CmpItemKindProperty", { fg=H.colors.nord11, bg=H.colors.nord0 })
highlight("CmpItemKindEvent", { fg=H.colors.nord11, bg=H.colors.nord0  })

highlight("CmpItemKindText", { fg=H.colors.nord7, bg=H.colors.nord0 })
highlight("CmpItemKindEnum", { fg=H.colors.nord7, bg=H.colors.nord0 })
highlight("CmpItemKindKeyword", { fg=H.colors.nord7, bg=H.colors.nord0 })

highlight("CmpItemKindConstant", { fg=H.colors.nord10, bg=H.colors.nord0 })
highlight("CmpItemKindConstructor", { fg=H.colors.nord10, bg=H.colors.nord0 })
highlight("CmpItemKindReference", { fg=H.colors.nord10, bg=H.colors.nord0 })

highlight("CmpItemKindFunction", { fg=H.colors.nord15, bg=H.colors.nord0 })
highlight("CmpItemKindStruct", { fg=H.colors.nord15, bg=H.colors.nord0 })
highlight("CmpItemKindClass", { fg=H.colors.nord15, bg=H.colors.nord0 })
highlight("CmpItemKindModule", { fg=H.colors.nord15, bg=H.colors.nord0 })
highlight("CmpItemKindOperator", { fg=H.colors.nord15, bg=H.colors.nord0 })

highlight("CmpItemKindVariable", { fg=H.colors.nord4, bg=H.colors.nord0 })
highlight("CmpItemKindFile", { fg=H.colors.nord4, bg=H.colors.nord0 })

highlight("CmpItemKindUnit", { fg=H.colors.nord12, bg=H.colors.nord0 })
highlight("CmpItemKindSnippet", { fg=H.colors.nord12, bg=H.colors.nord0 })
highlight("CmpItemKindFolder", { fg=H.colors.nord12, bg=H.colors.nord0 })

highlight("CmpItemKindMethod", { fg=H.colors.nord9, bg=H.colors.nord0 })
highlight("CmpItemKindValue", { fg=H.colors.nord9, bg=H.colors.nord0 })
highlight("CmpItemKindEnumMember", { fg=H.colors.nord9, bg=H.colors.nord0 })

highlight("CmpItemKindInterface", { fg=H.colors.nord8, bg=H.colors.nord0 })
highlight("CmpItemKindColor", { fg=H.colors.nord8, bg=H.colors.nord0 })
highlight("CmpItemKindTypeParameter", { fg=H.colors.nord8, bg=H.colors.nord0 })

-- Alpha
highlight("AlphaHeader", { fg=H.colors.nord9 })
highlight("AlphaButton", { fg=H.colors.nord8 })
highlight("AlphaFooter", { fg=H.colors.nord9 })

-- Lspsaga
highlight("SagaBorder", { bg=H.colors.nord0 })
highlight("TitleString", { bg=H.colors.nord14, fg=H.colors.nord0, bold=true })
highlight("TitleSymbol", { bg=H.colors.nord0, fg=H.colors.nord14 })
highlight("TitleIcon", { bg=H.colors.nord14, fg=H.colors.nord0 })
highlight("TitleFileIcon", { bg=H.colors.nord14, fg=H.colors.nord0 })


return H
