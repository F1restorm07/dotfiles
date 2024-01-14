local everforest_palette = require("everforest.colours").generate_palette(require("everforest").config, vim.o.background)
H = {}
H.colors = {
        none = everforest_palette.none,

        bg = everforest_palette.bg0,
        fg = everforest_palette.fg,
        bg_light = everforest_palette.bg2,

        gray_dark = everforest_palette.grey0,
        gray = everforest_palette.grey1,
        gray_light = everforest_palette.grey2,

        red = everforest_palette.red,
        orange = everforest_palette.orange,
        yellow = everforest_palette.yellow,
        green = everforest_palette.green,
        aqua = everforest_palette.aqua,
        blue = everforest_palette.blue,
        purple = everforest_palette.purple,

        bg_visual = everforest_palette.bg_visual,
        bg_red = everforest_palette.bg_red,
        bg_yellow = everforest_palette.bg_yellow,
        bg_green = everforest_palette.bg_green,
        bg_blue = everforest_palette.bg_blue,

        status_green = everforest_palette.statusline1,
        status_white = everforest_palette.statusline2,
        status_red = everforest_palette.statusline3,
        status_bg = everforest_palette.bg3,
        status_fill = everforest_palette.bg1,
}

local function highlight(name, opts)
        vim.api.nvim_set_hl(0, name, opts)
end

--  -------------------------------------------------------
--  {{{ Nvim-navic

highlight("WinBar", { bg=H.colors.bg })
highlight("NavicText", { fg=H.colors.fg })
highlight("NavicSeparator", { fg=H.colors.blue })

highlight("NavicIconsArray", { link = "@type" })
highlight("NavicIconsBoolean", { link = "@boolean" })
highlight("NavicIconsColor", { link = "@cosntant" })
highlight("NavicIconsNumber", { link = "@number" })
highlight("NavicIconsString", { link = "@string" })
highlight("NavicIconsVariable", { link = "@variable" })

highlight("NavicIconsConstant", { link = "@constant" })
highlight("NavicIconsConstructor", { link = "@constructor" })
highlight("NavicIconsKeyword", { link = "@keyword" })
highlight("NavicIconsNull", { link = "@number" })
highlight("NavicIconsUnit", { link = "@constant" })

highlight("NavicIconsEnumMember", { link = "@lsp.type.enumMember" })
highlight("NavicIconsField", { link = "@field" })
highlight("NavicIconsProperty", { link = "@property" })
highlight("NavicIconsEvent", { link = "@type" })

highlight("NavicIconsFile", { link = "Aqua" })
highlight("NavicIconsModule", { link = "Yellow" })
highlight("NavicIconsNamespace", { link = "@namespace" })
highlight("NavicIconsPackage", { link = "Aqua" })

highlight("NavicIconsFunction", { link = "@function" })
highlight("NavicIconsMethod", { link = "@method" })

highlight("NavicIconsClass", { link = "@lsp.type.class" })
highlight("NavicIconsEnum", { link = "@lsp.type.enum"})
highlight("NavicIconsInterface", { link = "@lsp.type.interface" })
highlight("NavicIconsStruct", { link = "@lsp.type.struct" })

highlight("NavicIconsKey", { link = "@property" })
highlight("NavicIconsObject", { link = "@lsp.type.class" })
highlight("NavicIconsOperator", { link = "@operator" })
highlight("NavicIconsTypeParameter", { link = "@lsp.type.typeParameter" })

--  }}}
--  -------------------------------------------------------
-- {{{ Alpha

highlight("AlphaHeader", { fg=H.colors.blue })
highlight("AlphaButton", { fg=H.colors.aqua })
highlight("AlphaFooter", { fg=H.colors.aqua })

--  }}}
--  -------------------------------------------------------
-- {{{ Tabline

highlight("TabLineSep", { fg=H.colors.status_green, bg=H.colors.status_bg })
highlight("TabLineInactiveSep", { fg=H.colors.status_bg, bg=H.colors.status_bg })
highlight("TabLineRearSep", { fg=H.colors.status_bg, bg=H.colors.status_green })
highlight("TabLineEndSep", { fg=H.colors.status_bg, bg=H.colors.status_fill })

--  }}}
--  -------------------------------------------------------
-- {{{ Statusline

highlight("StatusLine", { bg=H.colors.status_fill, fg=H.colors.gray })
highlight("StatusLineNC", { bg=H.colors.none, fg=H.colors.none })
highlight("StatusLineFill", { bg=H.colors.bg, fg=H.colors.bg })
highlight("StatusLineSepInactive", { bg=H.colors.bg, fg=H.colors.status_fill })

--  }}}
--  -------------------------------------------------------

return H
