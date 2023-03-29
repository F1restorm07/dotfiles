require('fzf-lua').setup({
        file_icon_padding = " ",
        previewers = {
                builtin = {
                        extensions = {
                                ['png'] = { 'chafa', '-f symbols' },
                                ['jpg'] = { 'chafa', '-f symbols' },
                                ['webp'] = { 'chafa', '-f symbols' }
                        }
                }
        }
})
