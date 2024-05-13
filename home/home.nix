{ pkgs, nix-colors, hyprland, ... }:

{
	imports = [
		nix-colors.homeManagerModules.default
        hyprland.homeManagerModules.default
		./modules
	];
	
	colorScheme = nix-colors.colorSchemes.tokyo-night-dark;
	# colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;
	
	home = {
		username = "master";
		homeDirectory = "/home/master";
		stateVersion = "23.11";
	};
}
