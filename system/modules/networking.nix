{ config, pkgs, ... }:

{
	networking = {
		hostName = "battlestation";
		networkmanager.enable = true;
		# wireless.enable = true;  # Enables wireless support via wpa_supplicant.
		enableIPv6 = false;
		firewall.enable = false;
	};
}
