require('mini.completion').setup({ -- TODO: customize appearance of completion (+ highlighting for rust-analyzer info)
    lsp_completion = {
        source_func = 'omnifunc',
        auto_setup = false,
    },
})
