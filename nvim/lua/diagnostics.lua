vim.diagnostic.config({
    severity_sort = true,
    underline = {
        severity = vim.diagnostic.severity.ERROR
    },
    virtual_text = {
        source = "if_many"
    },
    virtual_lines = {
        current_line = true,
    }
})

vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = ""})
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = ""})
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = ""})
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = ""})
