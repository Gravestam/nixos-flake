
{ config, pkgs, ... }:

{
	environment.systemPackages = [ 
		pkgs.gnumake
	];
}
