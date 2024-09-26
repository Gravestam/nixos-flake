{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
		./scripts
  ];

  system.stateVersion = "23.11";
}
