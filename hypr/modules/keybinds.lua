-- modules/keybinds.lua
-- See https://wiki.hypr.land/configuring/core/binds/

local p = require("modules.programs")
local mainMod = p.mainMod

---------------------------------------------------------------- apps / session
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(p.terminal))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(p.fileManager))
hl.bind(mainMod .. " + space",  hl.dsp.exec_cmd(p.menu))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("wofi-calc"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("wofi-temp"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("wofi-audio-sink"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("pkill waybar || waybar"))
hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd("qs kill || qs"))

-- hl.dsp.exec_cmd("uwsm stop") -- exit bind

-- Screenshots
-- hl.bind("Print",         hl.dsp.exec_cmd("hyprshot -m window"))
-- hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region"))

---------------------------------------------------------------- windows
hl.bind(mainMod .. " + W", hl.dsp.window.close())                      -- was killactive
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" })) -- was togglefloating

-- move focus
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

---------------------------------------------------------------- workspaces
-- mainMod + [0-9]         -> switch to workspace
-- mainMod + SHIFT + [0-9] -> move active window to workspace
for i = 1, 10 do
    local key = i % 10 -- workspace 10 is on key 0
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

---------------------------------------------------------------- media keys
-- locked = works on the lock screen, repeating = holds repeat
-- (these were bindel / bindl)
local held = { locked = true, repeating = true }

hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), held)
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      held)
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     held)
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   held)
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 5%+"),                            held)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"),                            held)

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
