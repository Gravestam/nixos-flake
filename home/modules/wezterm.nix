{ config, ... }:

{
	programs.wezterm = {
		enable = true;
		enableZshIntegration = true;

		extraConfig = ''

			local wezterm = require("wezterm")

			local config = wezterm.config_builder()

			config.color_scheme = "tokyonight_night"

			config.window_padding = {
				left = "10px",
				right = "10px",
				top = "10px",
				bottom = "10px",
			}

			config.initial_cols = 125
			config.initial_rows = 33

			config.enable_tab_bar = false
			config.enable_scroll_bar = false

			config.enable_wayland = false

			config.window_background_opacity = 1

			config.front_end = "WebGpu"

			config.font = wezterm.font("JetBrains Mono Nerd Font Mono")
			config.font_size = 11.0
			config.line_height = 1

			return config
		'';
	};
}
