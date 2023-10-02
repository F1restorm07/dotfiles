require('fzf-lua').setup({
        previewers = {
                builtin = {
                        extensions = {
                                ['png'] = { 'chafa', '-f', 'symbols' },
                                ['jpg'] = { 'chafa', '-f', 'symbols' },
                                ['webp'] = { 'chafa', '-f', 'symbols' }
                        }
                }
        },
})

-- require('fzf-lua.config')._devicons_setup = "~/.config/nvim/lua/devicons.lua"

--[[
todo
***
create custom previewer where each entry is a filename and location (line:col)
and the match is highlighted in the previewer (with either selection or custom highlight)
--]]
