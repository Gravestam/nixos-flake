{ pkgs, ... }:

{
	home.packages = [
		(pkgs.wineWowPackages.full.override {
			wineRelease = "staging";
			mingwSupport = true;
		})
		pkgs.winetricks
	];
}
