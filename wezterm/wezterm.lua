local wezterm = require 'wezterm'
local font = "JetBrainsMono NFM"
local LEFT_SEMI_CIRCLE = utf8.char(0xe0b6)
local RIGHT_SEMI_CIRCLE = utf8.char(0xe0b4)

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
        local background = '#4c556a'
        local foreground = '#d8dee9'

    if tab.is_active then
            background = '#8fbcbb'
            foreground = '#3b4252'
    end

    local edge_background = '#4c566a'
    local edge_foreground = background

    if tab.tab_index + 1 == #tabs then
        edge_background = '#3b4252'
    elseif tabs[tab.tab_index + 2].is_active then -- tab_index is zero-based, lua arrays are one-based
        edge_background = '#8fbcbb'
    end

    local title = tab.active_pane.foreground_process_name
    title = wezterm.truncate_right(string.format(' %d %s ', tab.tab_index, string.gsub(title, '(.*[/\\])(.*)', '%2 ')), max_width - 2)

    return {
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = RIGHT_SEMI_CIRCLE },
    }
    end
)

wezterm.on("update-status", function(window, pane)
        local sections = {}
        local date = wezterm.strftime("%m.%d/%H:%M")
        local battery = wezterm.battery_info()[1] -- battery info for builtin battery

        local cwd_uri = pane:get_current_working_dir() -- cwd and hostname
        if cwd_uri then
                cwd_uri = cwd_uri:sub(8)
                local slash = cwd_uri:find('/')
                cwd_uri = slash and cwd_uri:sub(slash) or cwd_uri

                local home_dir,n = cwd_uri:gsub('/Users/[^/]*', '~')
                if n == 0 then
                        home_dir,n = cwd_uri:gsub('/home/[^/]*', '~')
                end

                local cwd = home_dir

                table.insert(sections, cwd)
        end
        table.insert(sections, date)

        local elements = {}

        -- cwd
        table.insert(elements, { Foreground = { Color = '#81a1c1' }})
        table.insert(elements, { Background = { Color = '#3b4252' }})
        table.insert(elements, { Text = table.remove(sections, 1) .. ' ' })

        -- date
        table.insert(elements, { Foreground = { Color = '#8fbcbb' }})
        table.insert(elements, { Background = { Color = '#3b4252' }})
        table.insert(elements, { Text = LEFT_SEMI_CIRCLE })
        table.insert(elements, { Foreground = { Color = '#3b4252' }})
        table.insert(elements, { Background = { Color = '#8fbcbb' }})
        table.insert(elements, { Text = ' ' .. table.remove(sections, 1) })

        -- battery
        table.insert(elements, { Foreground = { Color = '#3b4252' }})
        table.insert(elements, { Background = { Color = '#8fbcbb' }})
        table.insert(elements, { Text = string.format(' %.0f%% ', battery.state_of_charge*100)})

        window:set_right_status(wezterm.format(elements));
end)

local keys = {
        {
                key = 'x',
                mods = 'LEADER',
                action = wezterm.action.CloseCurrentPane { confirm = true },

        },
        {
                key = '&',
                mods = 'LEADER|SHIFT',
                action = wezterm.action.CloseCurrentTab { confirm = true },
        },
        {
                key = 'c',
                mods = 'LEADER',
                action = wezterm.action.SpawnTab "CurrentPaneDomain"
        },
        {
                key = 's',
                mods = 'LEADER',
                action = wezterm.action.SplitVertical
        },
        {
                key = 'v',
                mods = 'LEADER',
                action = wezterm.action.SplitHorizontal
        },
        {
                key = '1',
                mods = 'LEADER',
                action = wezterm.action.ActivateTab(0)
        },
        {
                key = '2',
                mods = 'LEADER',
                action = wezterm.action.ActivateTab(1)
        },
        {
                key = '3',
                mods = 'LEADER',
                action = wezterm.action.ActivateTab(2)
        },
        {
                key = '4',
                mods = 'LEADER',
                action = wezterm.action.ActivateTab(3)
        },
        {
                key = '5',
                mods = 'LEADER',
                action = wezterm.action.ActivateTab(4)
        },
        {
                key = '6',
                mods = 'LEADER',
                action = wezterm.action.ActivateTab(5)
        },
        {
                key = '7',
                mods = 'LEADER',
                action = wezterm.action.ActivateTab(6)
        },
        {
                key = '8',
                mods = 'LEADER',
                action = wezterm.action.ActivateTab(7)
        },
        {
                key = '9',
                mods = 'LEADER',
                action = wezterm.action.ActivateTab(8)
        },
        {
                key = 'n',
                mods = 'LEADER',
                action = wezterm.action.ActivateTabRelative(1)
        },
        {
                key = 'p',
                mods = 'LEADER',
                action = wezterm.action.ActivateTabRelative(-1)
        },
        {
                key = 'h',
                mods = 'LEADER',
                action = wezterm.action.ActivatePaneDirection "Left"
        },
        {
                key = 'j',
                mods = 'LEADER',
                action = wezterm.action.ActivatePaneDirection "Down"
        },
        {
                key = 'k',
                mods = 'LEADER',
                action = wezterm.action.ActivatePaneDirection "Up"
        },
        {
                key = 'l',
                mods = 'LEADER',
                action = wezterm.action.ActivatePaneDirection "Right"
        },
        {
                key = 'o',
                mods = 'LEADER',
                action = wezterm.action.ActivatePaneDirection "Next"
        },
        {
                key = 'H',
                mods = 'LEADER',
                action = wezterm.action.AdjustPaneSize {"Left", 5}
        },
        {
                key = 'J',
                mods = 'LEADER',
                action = wezterm.action.AdjustPaneSize {"Down", 5}
        },
        {
                key = 'K',
                mods = 'LEADER',
                action = wezterm.action.AdjustPaneSize {"Up", 5}
        },
        {
                key = 'L',
                mods = 'LEADER',
                action = wezterm.action.AdjustPaneSize {"Right", 5}
        },
        {
                key = 'z',
                mods = 'LEADER',
                action = wezterm.action.TogglePaneZoomState
        }
}

return {
        font = wezterm.font_with_fallback { font },
        font_rules = {
                {
                        intensity = 'Bold',
                        italic = false,
                        font = wezterm.font_with_fallback {
                                {
                                        family = font,
                                        weight = "Bold",
                                        stretch = "Normal",
                                        style = "Normal"
                                },
                        }
                },
                {
                        intensity = 'Normal',
                        italic = true,
                        font = wezterm.font_with_fallback {
                                {
                                        family = font,
                                        weight = "Regular",
                                        stretch = "Normal",
                                        style = "Italic"
                                },
                        }
                },
                {
                        intensity = 'Bold',
                        italic = true,
                        font = wezterm.font_with_fallback {
                                {
                                        family = font,
                                        weight = "Bold",
                                        stretch = "Normal",
                                        style = "Italic"
                                },
                        }
                },

      },
        color_scheme = "nord",
        colors = {
                tab_bar = {
                        background = '#3b4252',

                        new_tab = {
                                bg_color = '#3b4252',
                                fg_color = '#3b4252',
                        },
                }
        },
        use_fancy_tab_bar = false,
        tab_bar_at_bottom = true,
        leader = { key = 'b', mods = 'CTRL' },
        keys = keys,
        enable_wayland = true,
}
