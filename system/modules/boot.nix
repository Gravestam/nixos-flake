{ config, pkgs, ... }:

{
  boot = {

    loader = {

      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;

      # Prevents the boot partition from running out of disk space...
      systemd-boot.configurationLimit = 3;
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

    extraModprobeConfig = ''
      options nvidia NVreg_UsePageAttributeTable=1
      options nvme_core default_ps_max_latency_us=5500
    '';

    kernelModules = [
      "kvm-amd"
      "nvidia"
    ];

    kernelParams = [
      "tsc=unstable"
      "acpi_enforce_resources=lax"
			"spec_store_bypass_disable=on"
    ];

    blacklistedKernelModules = [ "nouveau" ];

    kernelPackages = pkgs.linuxPackages_latest;

    extraModulePackages = [ config.boot.kernelPackages.rtl88xxau-aircrack ];
  };
}
