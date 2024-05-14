{ config, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
			
      window = {
        opacity = 1;
        dimensions = {
          columns = 110;
          lines = 30;
        };
        padding = {
          x = 10;
          y = 10;
        };
      };

      font = {
        size = 11;
        normal = {
          family = "JetBrains Mono Nerd Font Mono";
          style = "Regular";
        };
        italic = {
          family = "JetBrains Mono Nerd Font Mono";
          style = "Itablic";
        };
        bold = {
          family = "JetBrains Mono Nerd Font Mono";
          style = "Bold";
        };
      };

      colors = {

        normal = {
          black = "0x${config.colorScheme.colors.base00}";
          blue = "0x${config.colorScheme.colors.base0D}";
          cyan = "0x${config.colorScheme.colors.base0C}";
          green = "0x${config.colorScheme.colors.base0B}";
          magenta = "0x${config.colorScheme.colors.base0E}";
          red = "0x${config.colorScheme.colors.base08}";
          white = "0x${config.colorScheme.colors.base05}";
          yellow = "0x${config.colorScheme.colors.base09}";
        };

        bright = {
          black = "0x${config.colorScheme.colors.base03}";
          blue = "0x${config.colorScheme.colors.base0D}";
          cyan = "0x${config.colorScheme.colors.base0C}";
          green = "0x${config.colorScheme.colors.base0B}";
          magenta = "0x${config.colorScheme.colors.base0E}";
          red = "0x${config.colorScheme.colors.base08}";
          white = "0x${config.colorScheme.colors.base06}";
          yellow = "0x${config.colorScheme.colors.base09}";
        };

        cursor = {
          cursor = "0x${config.colorScheme.colors.base06}";
          text = "0x${config.colorScheme.colors.base06}";
        };

        primary = {
          background = "0x${config.colorScheme.colors.base00}";
          foreground = "0x${config.colorScheme.colors.base05}";
        };
      };
    };
  };
}
