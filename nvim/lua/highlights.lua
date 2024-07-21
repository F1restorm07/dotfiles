H = {}
H.colors = {
    bg = vim.g.terminal_color_0,
    bg_light = "#3d425b",
    white = vim.g.terminal_color_7,

    gray = vim.g.terminal_color_8,
    gray_light = vim.g.terminal_color_15,

    red = vim.g.terminal_color_1,
    bg_red = "#3d0d0d",

    orange = vim.g.terminal_color_3,
    bg_orange = "#3d210d",

    green = vim.g.terminal_color_2,
    bg_green = "#2a2d17",

    aqua = vim.g.terminal_color_6,
    bg_aqua = "#182b2f",

    blue = vim.g.terminal_color_4,
    bg_blue = "#162131",

    purple = vim.g.terminal_color_5,
    bg_purple = "#1f1931",

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
highlight("PmenuSel", { fg=H.colors.blue, bg=H.colors.bg_light, bold=true })

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
highlight("@markup.link.label", { link = "Identifier" })
highlight("@markup.link.label.symbol", { link = "markdownHeadingDelimeter" })
highlight("@markup.link.url", { link = "markdownUrl" })

highlight("@markup.list", { link = "markdownListMarker" })
highlight("@markup.list.unchecked", { fg = H.colors.green })
highlight("@markup.list.checked", { fg = H.colors.gray })

--  }}}
--  -------------------------------------------------------
-- {{{ Comments

highlight("@comment.note", { fg = H.colors.blue, bold = true })
highlight("@comment.todo", { fg = H.colors.green, bold = true })
highlight("@comment.warning", { fg = H.colors.orange, bold = true })
highlight("@comment.error", { fg = H.colors.red, bold = true })
-- setting an lsp highlight to @lsp effectively disables the highlight
highlight("@lsp.type.comment", { link = "@lsp" })


-- }}}
--  -------------------------------------------------------
-- {{{ Plugins

highlight("LeapMatch", { fg = H.colors.white, bold = true, nocombine = true })

-- }}}
--  -------------------------------------------------------
-- {{{ LSP

-- TODO: add orange to function call in treesitter, like the original colorscheme

return H
