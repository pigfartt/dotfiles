-- modules/autostart.lua
-- Runs once when Hyprland starts (was exec-once).
-- See https://wiki.hypr.land/configuring/core/autostart/

hl.on("hyprland.start", function()
    hl.dispatch(hl.dsp.focus({ workspace = 1 }))  -- was: hyprctl dispatch workspace 1

    hl.exec_cmd("qs")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
end)
