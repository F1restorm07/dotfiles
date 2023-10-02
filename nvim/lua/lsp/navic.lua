require('nvim-navic').setup({
        icons = require('icons').symbol_map,
        lsp = {
                auto_attach = true,
        },
        separator = '  ',
        highlight = true,
})

vim.o.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"
