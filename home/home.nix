{ config, pkgs, pkgs-stable, lib, inputs, ...}: 

{
	imports = [
		./modules
	];

	home = {
		username = "master";
		homeDirectory = "/home/master";
		stateVersion = "23.11";
	};
}
