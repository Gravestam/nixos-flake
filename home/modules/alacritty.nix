{ config, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      colors = {
        bright = {
          black = "0x${config.colorScheme.colors.base00}";
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
        normal = {
          black = "0x${config.colorScheme.colors.base00}";
          blue = "0x${config.colorScheme.colors.base0D}";
          cyan = "0x${config.colorScheme.colors.base0C}";
          green = "0x${config.colorScheme.colors.base0B}";
          magenta = "0x${config.colorScheme.colors.base0E}";
          red = "0x${config.colorScheme.colors.base08}";
          white = "0x${config.colorScheme.colors.base05}";
          yellow = "0x${config.colorScheme.colors.base0A}";
        };
        primary = {
          background = "0x${config.colorScheme.colors.base00}";
          foreground = "0x${config.colorScheme.colors.base06}";
        };
      };
    };
  };
}
