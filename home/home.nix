{ nix-colors, ... }:

{
  imports = [
    nix-colors.homeManagerModules.default
    ./modules
  ];

  # colorScheme = nix-colors.colorSchemes.tokyo-night-dark;
  # colorScheme = nix-colors.colorSchemes.tokyo-city-dark;
  # colorScheme = nix-colors.colorSchemes.gruvbox-dark-soft;
  # colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;
  # colorScheme = nix-colors.colorSchemes.gruvbox-dark-hard;
  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;
  # colorScheme = nix-colors.colorSchemes.nord;

  home = {
    username = "master";
    homeDirectory = "/home/master";
    stateVersion = "23.11";
  };
}
