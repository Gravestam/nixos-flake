{ config, pkgs, ... }:

{
	services = {
		dbus.enable = true;
		picom.enable = true;
		openssh.enable = true;
		xserver = {
			enable = true;
			videoDrivers = [ "nvidia" ];
			layout = "us";
			displayManager = {
				sddm = {
					enable = false;
					wayland.enable = false;
				};
				lightdm.enable = false;
			};
		};
		gvfs.enable = true;
		udisks2.enable = true;
	};
}
