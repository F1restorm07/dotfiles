#!/usr/bin/env lua

local used = io.popen("hyprctl -j workspaces", 'r')
-- local used = io.popen("brew list")
local cmd = used:read("a")

print(cmd)

-- for line in used:lines("*l") do
--         print(line)
-- end
used:close()
