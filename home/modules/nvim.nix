{
{
  config,
  pkgs,
  nix-colors,
  ...
}:

let
  inherit (nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
in
{
 programs.neovim = {
 	enable = true;
 };
}
