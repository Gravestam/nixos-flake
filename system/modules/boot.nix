{ pkgs, ... }:

{
  boot = {

    loader = {

      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;

      # Prevents the boot partition from running out of disk space...
      systemd-boot.configurationLimit = 5;
    };

    initrd = {

      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "sdhci_pci"
      ];

      kernelModules = [ "nvidia" ];
    };

    kernelModules = [
      "kvm-amd"
      "nvidia"
    ];

    blacklistedKernelModules = [ "nouveau" ];

    kernelPackages = pkgs.linuxPackages_latest;

    extraModulePackages = [ ];
  };
}
