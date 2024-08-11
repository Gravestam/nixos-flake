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

    udev.extraRules = ''
      # Udev rule for NVIDIA devices
      SUBSYSTEM=="nvidia", MODE="0666"
    '';
  };
}
