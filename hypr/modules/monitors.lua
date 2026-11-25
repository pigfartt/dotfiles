-- modules/monitors.lua
-- See https://wiki.hypr.land/configuring/core/monitors/

hl.monitor({ output = "DP-4",     mode = "2560x1440@144", position = "0x0",       scale = 1 }) -- acer
hl.monitor({ output = "HDMI-A-2", mode = "1920x1080@60",  position = "320x-1080", scale = 1 }) -- ben-q

-- Pin workspaces to monitors.
hl.workspace_rule({ workspace = "1", monitor = "DP-4", default = true})
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-2", default = true})
