local wezterm = require 'wezterm'
local LEFT_DOWN_SLANT = utf8.char(0xe0b8)
local RIGHT_DOWN_SLANT = utf8.char(0xe0ba)
local LEFT_UP_SLANT = utf8.char(0xe0bc)
local RIGHT_UP_SLANT = utf8.char(0xe0be)

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
        local edge_background = '#3b4151'
        local background = '#4c5569'
        local foreground = '#e5e8ef'

    if tab.is_active then
            background = '#88bfcf'
            foreground = '#3b4151'
    end

    local edge_foreground = background
    local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

    return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = RIGHT_UP_SLANT },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = LEFT_DOWN_SLANT },
    }
    end
)

local keys = {
        {
                key = 'x',
                mods = 'LEADER',
                action = wezterm.action.CloseCurrentPane { confirm = true },
        },
        {
                key = 'd',
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
                action = wezterm.action.SplitVertical -- "CurrentPaneDomain"
        },
        {
                key = 'v',
                mods = 'LEADER',
                action = wezterm.action.SplitHorizontal -- "CurrentPaneDomain"
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
        -- defualt_prog = {"tmux", "new", "-A", "-s main"},
        -- default_prog = {"tmux", "new"},
        font = wezterm.font "JetBrainsMono Nerd Font Mono",
        color_scheme = "nord",
        colors = {
                tab_bar = {
                        background = '#3b4151',

                        new_tab = {
                                bg_color = '#3b4151',
                                fg_color = '#3b4151',
                        },
                }
        },

        use_fancy_tab_bar = false,
        tab_bar_style = {
                active_tab_left = wezterm.format {
                        { Background = { Color = '#88bfcf' } },
                        { Foreground = { Color = '#3b4151' } },
                        { Text = LEFT_DOWN_SLANT },
                },
                -- active_tab_right = wezterm.format {
                --         { Background = { Color = '#88bfcf' } },
                --         { Foreground = { Color = '#3b4151' } },
                --         { Text = RIGHT_UP_SLANT },
                -- },
                -- inactive_tab_left = wezterm.format {
                --         { Background = { Color = '#4c5569' } },
                --         { Foreground = { Color = '#e5e8ef' } },
                --         { Text = LEFT_DOWN_SLANT },
                -- },
                -- inactive_tab_right = wezterm.format {
                --         { Background = { Color = '#4c5569' } },
                --         { Foreground = { Color = '#e5e8ef' } },
                --         { Text = RIGHT_UP_SLANT },
                -- },
        },
        tab_bar_at_bottom = true,

        -- unix_domains = {
        --         { name = 'unix' },
        -- },
        -- default_gui_startup_args = { "connect", "unix" },

        leader = { key = 'b', mods = 'CTRL' },
        keys = keys,
}
