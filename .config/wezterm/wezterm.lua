local wezterm = require("wezterm")

return {
	-- Font configuration
	font = wezterm.font("JetBrains Mono"),

	-- Color scheme
	color_scheme = "Catppuccin Macchiato",

	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 0,
	},

	-- Key bindings
	keys = {
		-- F11 to toggle maximized state
		-- ISSUE: https://github.com/wez/wezterm/issues/6244
		-- {key="F11", mods="", action=wezterm.action.ToggleMaximized},

		-- Ctrl+F11 to toggle fullscreen
		{ key = "F11", mods = "CTRL", action = wezterm.action.ToggleFullScreen },
	},

	-- Disable tab bar
	enable_tab_bar = false,

	-- Disable scrollbar
	enable_scroll_bar = false,
}
