{ config, pkgs, ... }:

{
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
		portalPackage = pkgs.xdg-desktop-portal-hyprland;
	};

	environment.systemPackages = [
		pkgs.hyprpaper
		pkgs.qt5.qtwayland
		pkgs.qt6.qtwayland
		pkgs.wlogout
		pkgs.wl-clipboard
		pkgs.swaylock-effects
	];

	environment.sessionVariables = {
		NIXOS_OZONE_WL = "1";
	};
}
