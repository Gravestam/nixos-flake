{ pkgs, nix-colors, ... }:

{
	imports = [
		nix-colors.homeManagerModules.default
		./modules
	];
	
	# colorScheme = nix-colors.colorSchemes.tokyo-night-dark;
	# colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;
	colorScheme = nix-colors.colorSchemes.catppuccin-mocha;
	
	home = {
		username = "master";
		homeDirectory = "/home/master";
		stateVersion = "23.11";
	};
}
