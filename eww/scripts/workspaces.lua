#!/usr/bin/env lua

-- local used = io.popen("hyprctl -j workspaces", 'r')
-- local cmd = used:read("a")
-- local workspace = string.gmatch(cmd, )

local buttons = {
        "button :onclick 'hyprctl dispatch workspace 1 && ./scripts/workspaces.lua' :class '",
        "button :onclick 'hyprctl dispatch workspace 2 && ./scripts/workspaces.lua' :class '",
        "button :onclick 'hyprctl dispatch workspace 3 && ./scripts/workspaces.lua' :class '",
        "button :onclick 'hyprctl dispatch workspace 4 && ./scripts/workspaces.lua' :class '",
        "button :onclick 'hyprctl dispatch workspace 5 && ./scripts/workspaces.lua' :class '",
        "button :onclick 'hyprctl dispatch workspace 6 && ./scripts/workspaces.lua' :class '",
        "button :onclick 'hyprctl dispatch workspace 7 && ./scripts/workspaces.lua' :class '",
        "button :onclick 'hyprctl dispatch workspace 8 && ./scripts/workspaces.lua' :class '",
        "button :onclick 'hyprctl dispatch workspace 9 && ./scripts/workspaces.lua' :class '",
        "button :onclick 'hyprctl dispatch workspace 10 && ./scripts/workspaces.lua' :class '",
}
local workspaces = {
        "workspace_inactive",
        "workspace_inactive",
        "workspace_inactive",
        "workspace_inactive",
        "workspace_inactive",
        "workspace_inactive",
        "workspace_inactive",
        "workspace_inactive",
        "workspace_inactive",
        "workspace_inactive",
}

print(string.format("(box :class 'workspace' :halign 'center' :orientation 'h': spacing 30 %q )", buttons[1]))

-- for line in used:lines("*l") do
--         print(line)
-- end
-- used:close()
