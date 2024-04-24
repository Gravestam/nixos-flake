{ config, pkgs, pkgs-unstable, ... }:

{
	windowManager.awesome = {
		enable = true;
		extraPackages = with pkgs-unstable; [
			luarocks
			luadbi-mysql
		];
	};
}
