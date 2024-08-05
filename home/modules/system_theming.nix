{
  config,
  pkgs,
  nix-colors,
  ...
}:

let
  inherit (nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
in
{
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.catppuccin-cursors;
      name = "mochaDark";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    theme = {
      package = gtkThemeFromScheme { scheme = config.colorScheme; };
      name = "${config.colorScheme.slug}";
    };
  };

  qt = {
    enable = true;
    platformTheme = { name = "gtk3"; };
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
