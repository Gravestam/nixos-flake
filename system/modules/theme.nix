{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.adwaita-icon-theme # default gnome cursors
    libsForQt5.breeze-qt5
    libsForQt5.breeze-gtk
    libsForQt5.qtstyleplugins
    themechanger
    papirus-icon-theme
    glib
    gsettings-desktop-schemas
    nwg-look
  ];

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk2";
  };
}
