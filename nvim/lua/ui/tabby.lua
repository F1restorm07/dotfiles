local util = require('tabby.util')
local filename = require('tabby.filename')
local theme = {
        fill = 'TabLineFill',
        head = 'TabLine',
        current_tab = 'TabLineSel',
        tab = 'TabLine',
        win = 'TabLine',
        tail = 'TabLine'
}

require('tabby.tabline').set(function(line)
        return {
                {
                        { '  ', hl = theme.head },
                },
                line.tabs().foreach(function(tab)
                        local hl = tab.is_current() and theme.current_tab or theme.tab
                        local end_hl = line.api.get_tabs()[tab.id + 1] == nil and theme.fill or theme.tab

                        return {
                                line.sep('', theme.tab, hl),
                                tab.is_current() and '  ' or '  ',
                                tab.number(),
                                line.sep('', hl, end_hl),
                                hl = hl,
                                margin = '',
                        }
                end),
                {
                        { '%=', hl = theme.fill },
                },
                line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                        local hl = win.is_current() and theme.current_tab or theme.win
                        local end_hl = theme.win
                        if (line.api.get_tab_wins(line.api.get_current_tab())[vim.api.nvim_win_get_number(win.id) - 1] == nil)
                                then
                                        end_hl = theme.fill
                                end
                        return {
                                line.sep('', hl, end_hl),
                                win.is_current() and ' ' or ' ',
                                win.buf_name(),
                                line.sep(' ', theme.win, hl),
                                hl = hl,
                                margin = '',
                        }
                end),
                {
                        line.sep('', theme.tail, theme.tail),
                        { '  ', hl = theme.tail },
                }
        }
end)
