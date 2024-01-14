local types = require('luasnip.util.types')

require('luasnip').config.set_config({
        region_check_events = "CursorMoved,CursorHold,InsertEnter",
        delete_check_events = "InsertLeave",
        update_events = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        ext_opts = {
                [types.choiceNode] = {
                        active = {
                                virt_text = { { '$', "@float" } }
                        }
                },
                [types.insertNode] = {
                        active = {
                                virt_text = { { '#', "@storageclass" } }
                        }
                }
        }
})
--
require('luasnip.loaders.from_vscode').lazy_load()
