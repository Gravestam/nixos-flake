{ config, ... }:

let
  colors = config.colorScheme.palette;
in
{
  programs.foot = {
    enable = true;
		server.enable = true;

    settings = {

      main = {
        term = "xterm-256color";
        font = "JetBrains Mono Nerd Font Mono:size=11";
				initial-window-size-chars="110x30";
        pad = "10x10";
      };

      colors = {
        regular0 = "${colors.base00}"; # black
        regular1 = "${colors.base08}"; # red
        regular2 = "${colors.base0B}"; # green
        regular3 = "${colors.base09}"; # yellow
        regular4 = "${colors.base0D}"; # blue
        regular5 = "${colors.base0E}"; # magenta
        regular6 = "${colors.base0C}"; # cyan
        regular7 = "${colors.base05}"; # white

        bright0 = "${colors.base03}"; # b black
        bright1 = "${colors.base08}"; # b red
        bright2 = "${colors.base0B}"; # b green
        bright3 = "${colors.base09}"; # b yellow
        bright4 = "${colors.base0D}"; # b blue
        bright5 = "${colors.base0E}"; # b magenta
        bright6 = "${colors.base0C}"; # b cyan
        bright7 = "${colors.base06}"; # b white

        background = "${colors.base00}";
        foreground = "${colors.base05}";

				alpha = 1;
      };

      cursor = {
        style = "block";
				color = "${colors.base06} ${colors.base06}";
      };
    };
  };
}
