I = {}

I.symbol_map = {
        Array = "[] ",
        Boolean = "bool ",
        Class = "struct ",
        Color = "#000 ",
        Constant = "const ",
        Constructor = "new ",
        Enum = "enum ",
        EnumMember = "::",
        Event = "",
        Field = ".",
        File = "",
        Folder = "",
        Function = "fn ",
        Interface = "trait ",
        Key = "> ",
        Keyword = "",
        Method = "fn ",
        Module = "mod ",
        Namespace = "nsp ",
        Null = "\\0",
        Number = "00 ",
        Object = "~ ",
        Operator = "+ ",
        Package = "",
        Property = "",
        String = "\" ",
        Struct = "struct ",
        TypeParameter = "type ",
        Unit = "_",
        Variable = "var ",
}

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = ""})
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = ""})
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = ""})
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = ""})

return I
