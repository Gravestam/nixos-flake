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
		};
	};
}
