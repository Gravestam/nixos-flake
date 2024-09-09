{ pkgs, pkgs-stable, ... }:

{
	home.packages = [
		(pkgs.wineWowPackages.full.override {
			wineRelease = "staging";
			mingwSupport = true;
		})
		pkgs.winetricks
		pkgs.dxvk
	];
}
# {
# 	home.packages = [
# 		(pkgs-stable.wineWowPackages.full.override {
# 			wineRelease = "staging";
# 			mingwSupport = true;
# 		})
# 		pkgs-stable.winetricks
# 	];
# }
