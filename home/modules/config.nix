{ ... }:

let
  configdir = ../config;
in
{
  home.file = {
    ".config/fastfetch".source = "${configdir}/fastfetch";
    ".config/hypr/scripts".source = "${configdir}/hypr/scripts";
    ".config/swappy".source = "${configdir}/swappy";
    ".config/tmux".source = "${configdir}/tmux";
  };
}
