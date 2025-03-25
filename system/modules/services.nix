{ pkgs, ... }:

{
	services = {
		dbus.enable = true;
		picom.enable = false;
		openssh.enable = true;
		gvfs.enable = true;
		udisks2.enable = true;
		displayManager.sddm.enable = false;
		xserver = {
			enable = true;
			videoDrivers = [ "nvidia" ];
			xkb.layout = "us";
			displayManager.lightdm.enable = false;
		};

		udev = {
			extraRules = ''
				SUBSYSTEM=="nvidia", MODE="0666"
			'';
			packages = [
				pkgs.vial
				pkgs.via
			];
		};
	};
}
