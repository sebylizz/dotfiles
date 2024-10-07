local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'nightfox'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10
config.window_background_image = "C:/Users/Sebastian/back.jpg"
config.default_domain = "WSL:Ubuntu"
config.default_cwd = "~"
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_background_image_hsb = {
    brightness = 0.04,
}
config.window_background_opacity = 1
config.window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2
}

config.initial_rows = 50
config.initial_cols = 170

return config
