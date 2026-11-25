-- modules/input.lua
-- See https://wiki.hypr.land/configuring/core/config-options/ (input)

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        natural_scroll = true,
        follow_mouse = 1,

        sensitivity = 0.25,   -- -1.0 to 1.0, 0 means no modification
        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
        },
    },
})
