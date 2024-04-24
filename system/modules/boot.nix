{ config, pkgs, lib, ... }:

{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-amd" "nvidia" ];
	boot.kernelParams = [ "nomodeset" ];
	boot.blacklistedKernelModules = [ "nouveau" ];
	boot.kernelPackages = pkgs.linuxPackages_latest;
	boot.extraModulePackages = [ ];
}
