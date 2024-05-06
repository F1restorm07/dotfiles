H = {}
H.colors = {
        bg = vim.g.terminal_color_0,
        white = vim.g.terminal_color_7,

        gray = vim.g.terminal_color_8,
        gray_light = vim.g.terminal_color_15,

        red = vim.g.terminal_color_1,
        orange = vim.g.terminal_color_3,
        green = vim.g.terminal_color_2,
        aqua = vim.g.terminal_color_6,
        blue = vim.g.terminal_color_4,
        purple = vim.g.terminal_color_5,

        status_green = vim.g.terminal_color_10,
        status_red = vim.g.terminal_color_9,
        status_bg = vim.g.terminal_color_7,
        status_fill = "#161821", -- the iceberg scheme normal background color
}

local function highlight(name, opts)
        vim.api.nvim_set_hl(0, name, opts)
end

--  -------------------------------------------------------
-- {{{ Ui

highlight("FloatBorder", { fg=H.colors.aqua, bg=H.colors.bg })
highlight("NormalFloat", { bg=H.colors.bg })
highlight("Pmenu", { bg=H.colors.bg })
highlight("PmenuSel", { fg=H.colors.blue, bg="#3d425b", bold=true })

--  -------------------------------------------------------
-- {{{ Alpha

highlight("AlphaHeader", { link = "Special" })
highlight("AlphaButton", { link = "Constant" })
highlight("AlphaFooter", { link = "Identifier" })

--  }}}
--  -------------------------------------------------------
-- {{{ Tabline

highlight("TabLineSel", { fg=H.colors.status_fill, bg=H.colors.status_green })
highlight("TabLineSep", { fg=H.colors.status_green, bg=H.colors.status_fill })
highlight("TabLineInactiveSep", { fg=H.colors.status_fill, bg=H.colors.status_fill })
highlight("TabLineRearSep", { fg=H.colors.status_fill, bg=H.colors.status_green })
highlight("TabLineEndSep", { fg=H.colors.status_fill, bg=H.colors.status_fill })

--  }}}
--  -------------------------------------------------------
-- {{{ Statusline

highlight("StatusLine", { bg=H.colors.bg, fg=H.colors.gray })
highlight("StatusLineNC", { bg=H.colors.bg, fg=H.colors.gray })
highlight("StatusLineFill", { bg=H.colors.status_fill, fg=H.colors.status_fill })
highlight("StatusLineSepInactive", { bg=H.colors.status_fill, fg=H.colors.status_fill })

--  }}}
--  -------------------------------------------------------
-- {{{ Markdown

highlight("@markup", { link = "@none" })
highlight("@markup.environment", { link = "Macro" })
highlight("@markup.environment.name", { link = "Type" })

highlight("@markup.raw", { link = "String" })
highlight("@markup.math", { link = "Special" })
highlight("@markup.strong", { fg = H.colors.green, bold = true })
highlight("@markup.italic", { italic = true })
highlight("@markup.strikethrough", { strikethrough = true })
highlight("@markup.underline", { underline = true })

highlight("@markup.heading", { link = "Title" })
highlight("@markup.heading.1", { fg = H.colors.purple, bold = true })
highlight("@markup.heading.2", { fg = H.colors.blue, bold = true })
highlight("@markup.heading.3", { fg = H.colors.aqua, bold = true })

highlight("@markup.link", { link = "markdownCode" })
highlight("@markup.link.label", { link = "SpecialChar" })
highlight("@markup.link.label.symbol", { link = "Identifier" })
highlight("@markup.link.url", { link = "markdownUrl" })

highlight("@markup.list", { link = "markdownListMarker" })
highlight("@markup.list.unchecked", { fg = H.colors.green })
highlight("@markup.list.checked", { fg = H.colors.gray })

return H
