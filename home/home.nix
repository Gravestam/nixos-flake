{ pkgs, nix-colors, ... }:

{
	imports = [
		nix-colors.homeManagerModules.default
		./modules
	];
	
	# colorScheme = nix-colors.colorSchemes.tokyo-night-storm;
	colorScheme = nix-colors.colorSchemes.tokyo-night-dark;
	# colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;
	
	home = {
		username = "master";
		homeDirectory = "/home/master";
		stateVersion = "23.11";
	};
}
