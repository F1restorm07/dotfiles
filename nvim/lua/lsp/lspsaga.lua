local get = require('icons').get
local colors = require('highlights').colors
local custom_kind = require('icons').symbol_map
local saga = require 'lspsaga'

saga.init_lsp_saga({
        border_style = "rounded",
        diagnostic_header = { get("x-circle"), get("no-entry"), get("question"), get("info") },
        code_action_lightbulb = {
                enable = false,
        },
        symbol_in_winbar = {
                enable = true,
                separator = get("chevron-right") .. ' '
        },
        custom_kind = {
                Class = {custom_kind.Class .. ' ', colors.nord15},
                Constant = {custom_kind.Constant .. ' ', colors.nord8},
                Constructor = {custom_kind.Constructor .. ' ', colors.nord7},
                Enum = {custom_kind.Enum .. ' ', colors.nord14},
                EnumMember = {custom_kind.EnumMember .. ' ', colors.nord14},
                Event = {custom_kind.Event .. ' ', colors.nord15},
                Field = {custom_kind.Field .. ' ', colors.nord10},
                File = {custom_kind.File .. ' ', colors.fg},
                Function = {custom_kind.Function .. ' ', colors.nord15},
                Interface = {custom_kind.Interface .. ' ', colors.nord12},
                Key = {custom_kind.Keyword .. ' ', colors.nord11},
                Method = {custom_kind.Method .. ' ', colors.nord15},
                Module = {custom_kind.Module .. ' ', colors.nord7},
                Operator = {custom_kind.Operator .. ' ', colors.nord14},
                Property = {custom_kind.Property .. ' ', colors.nord8},
                Struct = {custom_kind.Struct .. ' ', colors.nord15},
                String = {custom_kind.Text .. ' ', colors.nord14},
                TypeParameter = {custom_kind.TypeParameter .. ' ', colors.nord14},
                Variable = {custom_kind.Variable .. ' ', colors.nord7}
        }
})

vim.fn.sign_define("DiagnosticSignError", { text = get("x-circle"), texthl = "DiagnosticSignError", numhl = ""})
vim.fn.sign_define("DiagnosticSignWarn", { text = get("no-entry"), texthl = "DiagnosticSignWarn", numhl = ""})
vim.fn.sign_define("DiagnosticSignHint", { text = get("question"), texthl = "DiagnosticSignHint", numhl = ""})
vim.fn.sign_define("DiagnosticSignInfo", { text = get("info"), texthl = "DiagnosticSignInfo", numhl = ""})
