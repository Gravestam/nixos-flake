{ ... }:

{
  services = {
    dbus.enable = true;
    picom.enable = true;
    openssh.enable = true;
		printing = {
			enable = true;
			cups-pdf.enable = true;
		};
    gvfs.enable = true;
    udisks2.enable = true;
    displayManager.sddm.enable = false;
    xserver = {
      displayManager.lightdm = {
        enable = false;
      };
      enable = true;
      videoDrivers = [ "nvidia" ];
      xkb.layout = "us";
    };
  };
}
