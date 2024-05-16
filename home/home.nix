{ ... }:

{
  imports = [
    nix-colors.homeManagerModules.default
    ./modules
  ];

  home = {
    username = "master";
    homeDirectory = "/home/master";
    stateVersion = "23.11";
  };
}
