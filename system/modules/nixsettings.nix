{ config, pkgs, ... }:

{
	documentation.nixos.enable = true;

	nixpkgs.config.allowUnfree = true;

	nix.settings = {
		warn-dirty = false;
		experimental-features = [ "nix-command" "flakes" ];
		auto-optimise-store = true;
	};

	nix.gc = {
		automatic = false;
		dates = "weekly";
		options = "--delete-older-than 45d";
	};
}
