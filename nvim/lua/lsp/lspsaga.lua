require('lspsaga').setup({
        border_style = "rounded",
        diagnostic_header = { "", "", "", "" },
        lightbulb = {
                enable = false,
        },
        symbol_in_winbar = {
                enable = true,
                separator = ' ' .. '' .. ' ',
                folder_level = 0,
        },
        ui = {
                kind = {
                        ["Class"]         = {"" .. ' ',           "@lsp.type.class"},
                        ["Constant"]      = {"" .. ' ',           "@constant"},
                        ["Constructor"]   = {"" .. ' ',           "@constructor"},
                        ["Enum"]          = {"" .. ' ',           "@lsp.type.enum"},
                        ["EnumMember"]    = {"" .. ' ',           "@lsp.type.enumMember"},
                        ["Event"]         = {"" .. ' ',           ""},
                        ["Field"]         = {"" .. ' ',           "@field"},
                        ["File"]          = {"" .. ' ',           ""},
                        ["Function"]      = {"" .. ' ',           "@function"},
                        ["Interface"]     = {"" .. ' ',           "@lsp.type.interface"},
                        ["Key"]           = {"" .. ' ',           "@keyword"},
                        ["Method"]        = {"" .. ' ',           "@lsp.type.method"},
                        ["Module"]        = {"" .. ' ',           "@namespace"},
                        ["Operator"]      = {"" .. ' ',           "@operator"},
                        ["Property"]      = {"" .. ' ',           "@lsp.type.property"},
                        ["Struct"]        = {"" .. ' ',           "@lsp.type.struct"},
                        ["String"]        = {"" .. ' ',           "@string"},
                        ["TypeParameter"] = {"" .. ' ',           "@lsp.type.typeParameter"},
                        ["Variable"]      = {"" .. ' ',           "@variable"},
                        ["Namespace"]     = {"" .. ' ',           "@namespace"},
                        ["Package"]       = {"" .. ' ',           ""},
                        ["Number"]        = {"" .. ' ',           "@number"},
                        ["Boolean"]       = {"" .. ' ',           "@boolean"},
                        ["Array"]         = {"" .. ' ',           "@type"},
                        ["Object"]        = {"" .. ' ',           "@constant"},
                },
                colors = {
                        normal_bg = "#2e3440",
                        title_bg  = "#2e3440",
                        red       = "#bf616a",
                        orange    = "#d08770",
                        yellow    = "#ebcb8b",
                        green     = "#a3be8c",
                        blue      = "#81a1c1",
                        purple    = "#8fbcbb",
                        magenta   = "#b48ead",
                        white     = "#eceff4",
                        black     = "#2e3440"
                },
                border = "rounded",
                title = false,
        },
        diagnostic = {
                show_code_action = false,

        }
})

