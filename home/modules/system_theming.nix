{ pkgs, ... }:

{
  gtk = {
    enable = true;
		cursorTheme = { package = pkgs.catppuccin-cursors; name = "mochaDark"; };
		iconTheme = { package = pkgs.papirus-icon-theme; name = "Papirus-Dark"; };
		theme = { package = pkgs.adw-gtk3; name = "adw-gtk3-dark"; };
  };

  qt = {
    enable = true;
    platformTheme = "gtk3";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
