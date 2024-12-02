{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    nerd-fonts.hack
    nerd-fonts.meslo-lg
    nerd-fonts.fira-code
    nerd-fonts.sauce-code-pro
		texlivePackages.lobster2
		poppins
  ];
}
