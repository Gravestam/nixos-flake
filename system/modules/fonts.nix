{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerdfonts
		texlivePackages.lobster2
		poppins
  ];
}
