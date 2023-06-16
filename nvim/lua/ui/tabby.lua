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

        local tabline_tabs = line.tabs()
        local tabline_wins = line.wins_in_tab(line.api.get_current_tab())

        return {
                {
                        { ' ', hl = theme.head },
                        -- line.sep('', theme.head, theme.head),
                },
                line.tabs().foreach(function(tab) -- current tab (how to set previous tab hl)
                        local hl = tab.is_current() and theme.current_tab or theme.tab
                        local end_next_sect_hl = theme.tab
                        local end_curr_hl = hl

                        local tabs = line.api.get_tabs()

                        if tabs[tab.number() + 1] == nil then
                                end_next_sect_hl = theme.fill
                        end
                        -- if tabs[tab.number() + 1] then
                        --         end_curr_hl = theme.win
                        -- end

                        return {
                                line.sep('', theme.tab, hl),
                                ' ' .. tab.number(),
                                line.sep('', end_curr_hl, end_next_sect_hl),
                                hl = hl,
                                margin = '',
                        }
                end),
                {
                        { '%=', hl = theme.fill },
                },
                line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                        local hl = win.is_current() and theme.current_tab or theme.win
                        local end_curr_hl = hl
                        local end_next_sect_hl = theme.win

                        local wins = line.api.get_tab_wins(line.api.get_current_tab())
                        local curr_win = vim.api.nvim_win_get_number(win.id)

                        if wins[curr_win - 1] == nil then
                                end_next_sect_hl = theme.fill
                        end

                        return {
                                line.sep('', end_curr_hl, end_next_sect_hl),
                                win.buf_name() .. ' ',
                                line.sep('', theme.win, hl),
                                hl = hl,
                                margin = '',
                        }
                end),
                {
                        -- line.sep(' ', theme.tail, theme.tail),
                        { ' ', hl = theme.tail },
                }
        }
end)
