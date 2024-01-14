I = {}

I.symbol_map = {
        Array = "[x] ",
        Boolean = "<-> ",
        Class = "\\=\\ ",
        Color = "#ff ",
        Constant = "[=] ",
        Constructor = "new ",
        Enum = "-|> ",
        EnumMember = "::",
        Event = "",
        Field = ".",
        File = "",
        Folder = "",
        Function = "f(x) ",
        Interface = ".=() ",
        Key = "> ",
        Keyword = "",
        Method = "f(x) ",
        Module = "|++| ",
        Namespace = "{x} ",
        Null = "\\0",
        Number = "000 ",
        Object = "[.*] ",
        Operator = "+-/ ",
        Package = "",
        Property = "",
        String = "\" ",
        Struct = ".= ",
        TypeParameter = "-<> ",
        Unit = "_",
        Variable = "x ",
}

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = ""})
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = ""})
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = ""})
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = ""})

return I
