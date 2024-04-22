{ config, pkgs, ... }:

{
	users.users.master = {
		isNormalUser = true;
		shell = pkgs.zsh;
		extraGroups = [
			"wheel"
			"networkmanager"
			"qemu"
			"kvm"
			"libvirtd"
		];
	};
}
