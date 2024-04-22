{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		gnome3.adwaita-icon-theme # default gnome cursors
		papirus-icon-theme
		glib
		gsettings-desktop-schemas
		nwg-look
	];
}
