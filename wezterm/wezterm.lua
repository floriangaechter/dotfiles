-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night Storm'

config.font = wezterm.font("Berkeley Mono")
config.font_size = 18
config.line_height = 1.5

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

-- and finally, return the configuration to wezterm
return config
