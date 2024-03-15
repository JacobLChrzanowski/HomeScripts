local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

-- kitty key encoding
-- https://wezfurlong.org/wezterm/config/key-encoding.html#windows
config.enable_kitty_keyboard = true
config.allow_win32_input_mode = true
-- term
config.term = 'xterm-256color'
-- opacity
--config.window_background_opacity = 0
--config.text_background_opacity = 0.8
--config.win32_system_backdrop = 'Mica'
-- Style
-- https://wezfurlong.org/wezterm/colorschemes/s/index.html#solarized-dark-terminalsexy
config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.color_scheme = 'OceanicNext (base16)'
--config.color_scheme = 'Oceanic-Next'
--config.color_scheme = 'OceanicMaterial'

-- Font
config.font_size = 10
config.dpi = 96
config.font = wezterm.font(
    'Fira Code Regular',
    {}
)
-- X11
config.enable_wayland = true

-- Key Combos
config.keys = {
  -- paste from the clipboard
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  -- paste from the primary selection
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
  -- CTRL-SHIFT-l activates the debug overlay
  { key = 'L', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
}

-- Window Frame
config.window_frame = {
    font_size = 10
}
config.window_frame = {
    border_left_width = '0.0cell',
    border_right_width = '0.0cell',
    border_bottom_height = '0.0cell',
    border_top_height = '0.0cell',
    border_left_color = 'purple',
    border_right_color = 'purple',
    border_bottom_color = 'purple',
    border_top_color = 'purple',
}
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

return config
