{ nix-colors, ... }:

{
  imports = [
    nix-colors.homeManagerModules.default
    ./modules
  ];

	programs.home-manager.enable = true;

  home = {
    username = "master";
    homeDirectory = "/home/master";
    stateVersion = "23.11";
  };
}
