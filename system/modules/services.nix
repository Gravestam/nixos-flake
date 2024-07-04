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
      displayManager.lightdm = {
        enable = false;
      };
      enable = true;
      videoDrivers = [ "nvidia" ];
      xkb.layout = "us";
    };
  };
}
