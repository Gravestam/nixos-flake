{ pkgs, ... }:

{
  home.packages = [
    pkgs.haskellPackages.SVGFonts
  ];
}
