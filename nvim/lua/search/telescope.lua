local get = require("icons").get
local telescope = require('telescope')

telescope.setup({
        defaults = require('telescope.themes').get_dropdown {
                layout_config = {
                        vertical = { width = 0.5 }
                },
                theme = "dropdown",
                selection_caret = ' ' .. get("chevron-right") .. ' ',
                prompt_prefix = get("telescope") .. ' ',
                entry_prefix = '   ',
        }
})
-- telescope.load_extension('fzf')
-- telescope.load_extension('frecency')
