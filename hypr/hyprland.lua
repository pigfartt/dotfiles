-- ~/.config/hypr/hyprland.lua
-- Entry point. Each concern lives in modules/<name>.lua.
-- Each required file runs in its own scope, so locals don't leak between
-- modules; shared values (terminal, mainMod, ...) live in modules/programs.lua.
--
-- Order matters a little: monitors first, so everything after it applies
-- on top of the right display layout.

require("modules.monitors")     -- outputs + which workspaces live on which output
require("modules.env")          -- environment variables
require("modules.appearance")   -- gaps, borders, rounding, blur, layout, misc
require("modules.animations")   -- bezier curves + animation leaves
require("modules.input")        -- keyboard, mouse, per-device settings
require("modules.keybinds")     -- all binds
require("modules.rules")        -- window rules
require("modules.autostart")    -- things launched when Hyprland starts
