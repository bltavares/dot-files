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
  config.default_prog = { "pwsh", "-NoLogo" }
  config.keys = {
    { key = "!", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab({ DomainName = "local" }) },
    { key = "@", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab({ DomainName = "WSL:Debian" }) },
    { key = "#", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab({ DomainName = "SSH:gibson.internal" }) },
    { key = " ", mods = "CTRL", action = wezterm.action.SendKey({ key = " ", mods = "CTRL" }) }, -- workaround for native nvim.exe shortcut
  }
end

if is_linux() then
  config.keys = {
    -- wayland clipboard workaround
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom 'PrimarySelection' },
  }
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
  "mise.exe",
}

config.enable_scroll_bar = false
config.freetype_load_target = "HorizontalLcd"

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
if is_windows() then
  config.hide_tab_bar_if_only_one_tab = false
  config.window_padding = {
    top = "0.3cell",
    left = "1.0cell",
    right = "1.0cell",
    bottom = "0.3cell",
  }
  config.tab_bar_style = {
    window_hide = wezterm.format({
      { Text = " \u{eaba} " },
    }),
    window_hide_hover = wezterm.format({
      { Text = " \u{eaba} " },
    }),
    window_maximize = wezterm.format({
      { Text = " \u{eab9} " },
    }),
    window_maximize_hover = wezterm.format({
      { Text = " \u{eab9} " },
    }),
    window_close = wezterm.format({
      { Text = " \u{eab8} " },
    }),
    window_close_hover = wezterm.format({
      { Text = " \u{eab8} " },
    }),
  }
else
  config.hide_tab_bar_if_only_one_tab = true
  config.window_background_opacity = 0.8666666
  config.window_padding = {
    top = "1.5cell",
    left = "1.5cell",
    right = "1.5cell",
    bottom = "0.5cell",
  }
end
config.macos_window_background_blur = 30

wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
  position = "top",
  dividers = false,
  clock = { enabled = false },
})

-- Avoid changing the terminal size when increasing text size on videocalls
config.adjust_window_size_when_changing_font_size = false

-- and finally, return the configuration to wezterm
return config
