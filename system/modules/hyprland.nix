{ pkgs, ... }:

{
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
		portalPackage = pkgs.xdg-desktop-portal-hyprland;
	};

	environment.systemPackages = with pkgs; [
		qt5.qtwayland
		libsForQt5.qt5.qtwayland
		qt6.qtwayland
		wlogout
		wl-clipboard
		swaylock-effects
	];

	environment.sessionVariables = {
		NIXOS_OZONE_WL = "1";
		XDG_CURRENT_DESKTOP = "Hyprland";
		XDG_SESSION_TYPE = "wayland";
		XDG_SESSION_DESKTOP = "Hyprland";
		GBM_BACKEND = "nvidia-drm";
		__GLX_VENDOR_LIBRARY_NAME = "nvidia";
		LIBVA_DRIVER_NAME = "nvidia";
	};
}
