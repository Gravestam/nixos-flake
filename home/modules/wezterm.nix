{ config, ... }:

let
  colors = config.colorScheme.colors;
in
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;

    colorSchemes = {
      nix-colors = {
        ansi = [
          "#${colors.base00}"
          "#${colors.base0F}"
          "#${colors.base0B}"
          "#${colors.base09}"
          "#${colors.base0D}"
          "#${colors.base0C}"
          "#${colors.base0E}"
          "#${colors.base0A}"
        ];
        brights = [
          "#${colors.base03}"
          "#${colors.base0F}"
          "#${colors.base0B}"
          "#${colors.base09}"
          "#${colors.base0D}"
          "#${colors.base0C}"
          "#${colors.base0E}"
          "#${colors.base0A}"
        ];
        background = "#${colors.base00}";
        cursor_bg = "#${colors.base09}";
        cursor_border = "#${colors.base09}";
        cursor_fg = "#${colors.base00}";
        foreground = "#${colors.base09}";
        selection_bg = "#${colors.base02}";
        selection_fg = "#${colors.base09}";
      };
    };

    extraConfig = ''

      	local wezterm = require("wezterm")

      	local config = wezterm.config_builder()

      	-- config.color_scheme = "tokyonight_night"
      	config.color_scheme = "nix-colors"

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
