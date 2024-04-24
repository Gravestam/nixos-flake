{ config, pkgs, ... }:

{
	services = {
		dbus.enable = true;
		picom.enable = true;
		openssh.enable = true;
		gvfs.enable = true;
		udisks2.enable = true;
		displayManager.sddm.enable = false;
		xserver = {
			enable = true;
			videoDrivers = [ "nvidia" ];
			xkb.layout = "us";
		};
	};
}
