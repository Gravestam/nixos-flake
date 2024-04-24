{ config, pkgs, ... }:

{
	services = {
		dbus.enable = true;
		picom.enable = true;
		openssh.enable = true;
		xserver = {
			enable = true;
			autorun = false;
			videoDrivers = [ "nvidia" ];
			layout = "us";
			displayManager = {
				startx.enable = true;
				sddm = {
					enable = false;
					wayland.enable = false;
				};
				lightdm.enable = false;
			};
			windowManager.awesome.enable = true;
		};
		gvfs.enable = true;
		udisks2.enable = true;
	};
}
