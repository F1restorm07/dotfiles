-- TODO: add separators to tabs and windows
function Tabline()
        return table.concat({
                table.concat(T.tabline_tabs()),
                T.theme.fill,
                "%=",
                table.concat(T.tabline_wins()),
        })
end

vim.opt.tabline = "%!v:lua.Tabline()"

-------------------------------------------------

T = {}
local active_hl = "%#TabLineSel#"
local inactive_hl = "%#TabLine#"
local fill_hl = "%#TabLineFill#"
T.theme = {
        fill = fill_hl,
        head = inactive_hl,
        curr_tab = active_hl,
        tab = inactive_hl,
        curr_win = active_hl,
        win = inactive_hl,
        tail = inactive_hl,
        sep = "%#TabLineSep#",
        inactive_sep = "%#TabLineInactiveSep#",
        rear_sep = "%#TabLineRearSep#",
        end_sep = "%#TabLineEndSep#",
}

T.tabline_tabs = function()
        local tab_sections = {}
        local curr_tab = vim.api.nvim_get_current_tabpage()
        local tabs = vim.api.nvim_list_tabpages()

        for tab, tab_handle in ipairs(tabs) do
                local hl = tab_handle == curr_tab and T.theme.curr_tab or T.theme.tab
                local sep_hl = T.theme.sep

                if tabs[tab + 1] == curr_tab and tab_handle ~= curr_tab then
                        sep_hl = T.theme.rear_sep
                elseif tab_handle == vim.fn.tabpagenr('$') and tab_handle ~= curr_tab then
                        sep_hl = T.theme.end_sep
                elseif tabs[tab + 1] ~= curr_tab and tab_handle ~= curr_tab then
                        sep_hl = T.theme.inactive_sep
                end

                local tab_sect = string.format("%d%%X", tab)
                table.insert(tab_sections, hl .. ' ' .. tab_sect .. sep_hl .. '')
        end
        return tab_sections
end

T.tabline_wins = function()
        local win_sections = {}
        local curr_win = vim.api.nvim_get_current_win()
        local curr_tab = vim.api.nvim_get_current_tabpage()
        local wins_in_tab = vim.api.nvim_tabpage_list_wins(curr_tab)

        wins_in_tab = vim.tbl_filter(function(win)
                local win_buf = vim.api.nvim_win_get_buf(win)
                return vim.api.nvim_get_option_value("buflisted", { buf = win_buf })
        end, wins_in_tab)

        for win, win_handle in ipairs(wins_in_tab) do
                local hl = win_handle == curr_win and T.theme.curr_win or T.theme.win
                local buf_name = T.tabline_get_buf(win_handle)
                local sep_hl = T.theme.sep

                if wins_in_tab[win - 1] == curr_win and win_handle ~= curr_win then
                        sep_hl = T.theme.rear_sep
                elseif win_handle == wins_in_tab[1] and win_handle ~= curr_win then
                        sep_hl = T.theme.end_sep
                elseif win_handle ~= curr_win and wins_in_tab[win - 1] ~= curr_tab then

                        sep_hl = T.theme.inactive_sep
                end

                local win_sect = string.format("%s%%X", buf_name)
                table.insert(win_sections, sep_hl .. '' .. hl .. win_sect .. ' ')
        end
        return win_sections
end

T.tabline_get_buf = function(win_handle)
        local win_buf = vim.api.nvim_win_get_buf(win_handle)
        local buf_name = vim.api.nvim_buf_get_name(win_buf)
        local buf_type = vim.api.nvim_get_option_value("buftype", { buf = win_buf })
        local buf_listed = vim.api.nvim_get_option_value("buflisted", { buf = win_buf })

        if buf_type == "nofile" or buf_type == "acwrite" then
                return ''
        else
                buf_name = vim.fn.fnamemodify(buf_name, ":t")
                if buf_name == "" then
                        buf_name = "[no name]"
                end
        end
        return buf_name
end
