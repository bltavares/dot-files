-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local is_linux = function()
  return wezterm.target_triple:find("linux") ~= nil
end

local is_darwin = function()
  return wezterm.target_triple:find("darwin") ~= nil
end

local is_windows = function()
  return wezterm.target_triple:find("windows") ~= nil
end

if is_windows() then
  config.default_prog = { "pwsh" }
end

-- This is where you actually apply your config choices
--
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 16

-- For example, changing the color scheme:
config.color_scheme = "tokyonight_moon"

config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = {
  "bash",
  "sh",
  "zsh",
  "fish",
  "tmux",
  "nu",
  "cmd.exe",
  "pwsh.exe",
  "powershell.exe",
  "wsl.exe",
  "wslhost.exe",
}

config.enable_scroll_bar = false
config.freetype_load_target = "HorizontalLcd"

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.win32_system_backdrop = "Acrylic"
if is_windows() then
  config.window_background_opacity = 0.73
else
  config.window_background_opacity = 0.9666666
end
config.hide_tab_bar_if_only_one_tab = true
config.macos_window_background_blur = 30
config.window_padding = {
  top = "1.5cell",
  left = "1.5cell",
  right = "1.5cell",
  bottom = "0.5cell",
}

wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
  position = "top",
  dividers = false,
  clock = { enabled = false },
})

-- and finally, return the configuration to wezterm
return config
