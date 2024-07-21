require('fzf-lua').setup({
        previewers = {
                builtin = {
                        extensions = {
                                ['png'] = { 'wezterm', 'imgcat', '--resize', '800x600' },
                                ['jpg'] = { 'wezterm', 'imgcat', '--resize', '800x600' },
                                ['webp'] = { 'wezterm', 'imgcat', '--resize', '800x600' }
                        }
                }
        },
})
