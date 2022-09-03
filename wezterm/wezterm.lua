local wezterm = require 'wezterm'
local LEFT_DOWN_SLANT = utf8.char(0xe0b8)
local RIGHT_DOWN_SLANT = utf8.char(0xe0ba)
local LEFT_UP_SLANT = utf8.char(0xe0bc)
local RIGHT_UP_SLANT = utf8.char(0xe0be)
local LEFT_HALF_CIRCLE = ' ' .. utf8.char(0xe0b6)
local RIGHT_HALF_CIRCLE = utf8.char(0xe0b4) .. ' '

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

    local index = tab.tab_index
    local edge_foreground = background
    local title = tab.active_pane.title
    title = wezterm.truncate_right(string.format(' %d  %s ', index, title), max_width - 2)

    return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = RIGHT_DOWN_SLANT },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = LEFT_UP_SLANT },
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
        font = wezterm.font_with_fallback { "JetBrainsMono Nerd Font Mono", "nonicons" },
        font_dirs = { './nonicons/dist' },
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
        window_background_opacity = 0.9,
        -- text_background_opacity = 0.9,

        use_fancy_tab_bar = false,
        tab_bar_at_bottom = true,

        -- unix_domains = {
        --         { name = 'unix' },
        -- },
        -- default_gui_startup_args = { "connect", "unix" },

        leader = { key = 'b', mods = 'CTRL' },
        keys = keys,
}
