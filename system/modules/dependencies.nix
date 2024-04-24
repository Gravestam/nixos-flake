
{ config, pkgs, pkgs-unstable, ... }:

{
	environment.systemPackages = [ 
		pkgs.gnumake
	];
}
