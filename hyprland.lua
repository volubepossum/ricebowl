-- Monitor configuration
-- List your monitors with: hyprctl monitors

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = "1.2",
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "1920x0",
    scale = "",
})

local terminal    = "kitty"
local fileManager = "yazi"
local browser     = "firefox"
local menu        = "hyprlauncher"
local mainMod     = "SUPER"
local cursor_size = "24"

-- Idle configuration (using hypridle)
-- You'll need to install hypridle and configure it separately
-- TODO do the hypridle
-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/configuring/core/autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar --config ~/.config/waybar/config-hyprland.jsonc")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("hyprshell -c ~/.config/hypr/hyprshell.ron completions")
  hl.exec_cmd("hyprshell -c ~/.config/hypr/hyprshell.ron run")
end)

hl.on("config.reloaded", function()
    hl.exec_cmd("~/.config/hypr/wallpaper/setbingpicofday.sh")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/configuring/core/environment-variables/
hl.env("XCURSOR_SIZE", cursor_size)
hl.env("HYPRCURSOR_SIZE", cursor_size)
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- For all categories, see https://wiki.hyprland.org/Configuring/Variables/

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/configuring/core/advanced-configuration/permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------
-- Refer to https://wiki.hypr.land/configuring/core/config-options/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },
    dwindle = {
        -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        -- pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true, -- you probably want this
    },
    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        dim_inactive = true,
        dim_strength = 0.2,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/configuring/core/animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, damping = 24.21279333 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })



----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


----------------
---- LAYERS ----
----------------

hl.config({
    layers = {
        allow_new_top_layers_over_existing_fullscreen = true, -- Set to false to make newly mapped top layers render below existing covering fullscreen window
    },
})


---------------
---- INPUT ----
---------------
hl.config({
    input = {
        kb_layout = "gb,hu,dk,de",
        kb_variant = "extd,,,",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        numlock_by_default = true,
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = true,
            tap_and_drag = true,
            drag_lock = true,
            tap_to_click = true,
            middle_button_emulation = true,
            scroll_factor = 1.0,
            disable_while_typing = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})


---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + X", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys or mainMod + nvim keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move window with mainMod + arrow keys or mainMod + nvim keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(mainMod .. " + space", hl.dsp.focus({ urgent_or_last = true }))

hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("Return", hl.dsp.submap("reset"))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | wofi -S dmenu | cliphist decode | wl-copy"))


hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window -m active --clipboard-only"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output -m eDP-1 --clipboard-only"))

hl.bind(mainMod .. " + SHIFT + CTRL + left", function() local w = hl.get_active_workspace(); if not w then return end; hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = "l" })) end)
hl.bind(mainMod .. " + SHIFT + CTRL + right", function() local w = hl.get_active_workspace(); if not w then return end; hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = "r" })) end)
hl.bind(mainMod .. " + SHIFT + CTRL + up", function() local w = hl.get_active_workspace(); if not w then return end; hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = "u" })) end)
hl.bind(mainMod .. " + SHIFT + CTRL + down", function() local w = hl.get_active_workspace(); if not w then return end; hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = "d" })) end)

-- Keyboard layout next
hl.bind(mainMod .. " + ALT + space", hl.dsp.exec_cmd("hyprctl switchxkblayout at-translated-set-2-keyboard next"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume 
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- and for LCD brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/configuring/core/rules/


hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
match = {
    class = "^file_progress$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^confirm$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^dialog$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^download$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^notification$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^error$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^splash$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^confirmreset$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^Lxappearance$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^Rofi$",
    },
    float = true,
    animation = "= none",
})

hl.window_rule({
    match = {
        class = "^viewnior$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^Viewnior$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^feh$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^pavucontrol-qt$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^pavucontrol$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^file-roller$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^wlogout$",
    },
    -- TODO: manual review — unmapped window rule action: "fullscreen = on"
})

hl.window_rule({
    match = {
        title = "^wlogout$",
    },
    float = true,
    -- TODO: manual review — unmapped window rule action: "fullscreen = on"
})

hl.window_rule({
    match = {
        title = "^(Media viewer)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Volume Control)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Picture-in-Picture)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Volume Control)$",
    },
    size = "= 800 600",
    move = "= 75 44%",
})
