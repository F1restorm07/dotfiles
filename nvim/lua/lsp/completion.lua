require('mini.completion').setup({ -- TODO: customize appearance of completion (+ highlighting for rust-analyzer info)
    lsp_completion = {
        source_func = 'omnifunc',
        auto_setup = false,
    },
    window = {
        signature = { border = 'single' }
    },
    delay = { signature = 100000000 } -- virtually disable the signature info, because it can tank the performance
})
