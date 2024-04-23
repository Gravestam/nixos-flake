{ config, pkgs, pkgs-unstable, ... }:

{
	programs.hyprland = {
		enable = true;

		xwayland.enable = true;

		portalPackage = pkgs.xdg-desktop-portal-hyprland;
	};

	environment.systemPackages = [
		pkgs.hyprpaper
		pkgs-unstable.hyprlock
		pkgs.libnotify
		pkgs.qt5.qtwayland
		pkgs.qt6.qtwayland
		pkgs.wlogout
		pkgs.wl-clipboard
	];

	environment.sessionVariables = {
		NIXOS_OZONE_WL = "1";
	};
}
