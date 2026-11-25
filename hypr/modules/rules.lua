-- modules/rules.lua
-- See https://wiki.hypr.land/configuring/core/rules/

-- Ignore maximize requests from apps.
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland.
-- NOTE: your original had `float 1, fullscreen_state 0` WITHOUT a `match:`
-- prefix, which in hyprlang made them effects (force-float), not conditions.
-- This is the upstream intent (match on them). See the migration notes.
hl.window_rule({
    name = "fix-xwayland-drags",
    match = { class = "^$", title = "^$", float = true, fullscreen = false },
    no_focus = true,
})

-- Transparency for unfocused terminals
hl.window_rule({ name = "kitty-opacity", match = { class = "kitty" }, opacity = "1.0 0.85" })
hl.window_rule({ name = "putty-opacity", match = { class = "putty" }, opacity = "1.0 0.85" })

-- Fix Librewolf file picker placement
hl.window_rule({
    name = "librewolf-file-picker",
    match = {
        class = "librewolf",
        title = "^(Enter name of file|Open|File Upload|Save File)$",
    },
    center = true,
    size = "450 300",
    workspace = "current",
})
