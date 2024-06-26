{ config, ... }:

let
	colors = config.colorScheme.colors;
in 
{
	programs.zellij = {
		enable = true;
		enableZshIntegration = true;

		settings = {
			theme = "nixcolors";
			themes.nixcolors = {
				fg = "#${colors.base05}";
				bg = "#${colors.base00}";
				black = "#${colors.base04}";
				red = "#${colors.base08}";
				green = "#${colors.base0B}";
				yellow = "#${colors.base0A}";
				blue = "#${colors.base0D}";
				magenta = "#${colors.base0E}";
				cyan = "#${colors.base0C}";
				white = "#${colors.base06}";
				orange = "#${colors.base09}";
			};

			simplified_ui = true; # If true, disable the ui blocks (arrows)
			pane_frames = false; # Toggle between having pane frames around the panes
			on_force_close = "detach"; # quit, detach
			default_mode = "normal"; # Startup mode: locked, normal
			mouse_mode = true;
			scroll_buffer_size = 10000;
			copy_on_select = true;
			styled_underlines = true;

			ui = {
				pane_frames = {
					rounded_corners = true;
					hide_session_name = true;
				};
			};
		};
	};
}
