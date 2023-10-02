H = {}
H.colors = require('nordic.colors')
H.nord_colors = {
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


-- Nvim-navic
highlight("WinBar", { bg =H.colors.bg })
highlight("NavicText", { fg=H.colors.fg })
highlight("NavicSeparator", { fg=H.nord_colors.nord8 })

highlight("NavicIconsArray", { link = "@type" })
highlight("NavicIconsBoolean", { link = "@boolean" })
highlight("NavicIconsColor", { link = "@cosntant" })
highlight("NavicIconsNumber", { link = "@number" })
highlight("NavicIconsString", { link = "@string" })
highlight("NavicIconsVariable", { link = "@variable" })

highlight("NavicIconsConstant", { link = "@constant" })
highlight("NavicIconsConstructor", { link = "@constructor" })
highlight("NavicIconsKeyword", { link = "@keyword" })
highlight("NavicIconsNull", { link = "None" })
highlight("NavicIconsUnit", { link = "@constant" })

highlight("NavicIconsEnumMember", { link = "@lsp.type.enumMember" })
highlight("NavicIconsField", { link = "@field" })
highlight("NavicIconsProperty", { link = "@property" })
highlight("NavicIconsEvent", { link = "Type" })

highlight("NavicIconsFile", { link = "CmpItemKindFile" })
highlight("NavicIconsModule", { link = "CmpItemKindModule" })
highlight("NavicIconsNamespace", { link = "@namespace" })
highlight("NavicIconsPackage", { link = "CmpItemKindFile" })

highlight("NavicIconsFunction", { link = "@function" })
highlight("NavicIconsMethod", { link = "@method" })

highlight("NavicIconsClass", { link = "@lsp.type.class" })
highlight("NavicIconsEnum", { link = "@lsp.type.enum"})
highlight("NavicIconsInterface", { link = "@lsp.type.interface" })
highlight("NavicIconsStruct", { link = "@lsp.type.struct" })

highlight("NavicIconsKey", { link = "None" })
highlight("NavicIconsObject", { link = "None" })
highlight("NavicIconsOperator", { link = "@operator" })
highlight("NavicIconsTypeParameter", { link = "@lsp.type.typeParameter" })

-- Alpha
highlight("AlphaHeader", { fg=H.nord_colors.nord9 })
highlight("AlphaButton", { fg=H.nord_colors.nord8 })
highlight("AlphaFooter", { fg=H.nord_colors.nord9 })

-- Tabby
highlight("TabLine", { bg=H.colors.bg, fg=H.colors.fg })
highlight("TabLineFill", { bg=H.colors.bg, fg=H.colors.fg })
highlight("TabLineSel", { bg=H.colors.blue2, fg=H.colors.bg })


return H
