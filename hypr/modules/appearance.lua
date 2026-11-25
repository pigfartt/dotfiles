-- modules/appearance.lua
-- Look and feel: gaps, borders, decoration, layout, misc.
-- Refer to https://wiki.hypr.land/configuring/core/config-options/

hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 1,

        border_size = 2,

        col = {
            active_border   = { colors = { "rgb(98971a)", "rgb(d65d0e)" }, angle = 45 },
            inactive_border = "rgb(504945)",
        },

        -- Resize windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
        allow_tearing = false,

        layout = "master",
    },

    decoration = {
        rounding = 1,
        rounding_power = 3,

        -- Transparency of focused / unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a, -- was rgba(1a1a1aee)
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
})

-- Layout settings. See https://wiki.hypr.land/configuring/layouts/master-layout/
hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 1,    -- 0 or 1 disables the anime mascot wallpapers
        disable_hyprland_logo = false,
    },
})
