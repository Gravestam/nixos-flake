{ ... }:

let
  configdir = ../config;
in
{
  home.file = {
    ".config/hypr/scripts".source = "${configdir}/hypr/scripts";
    ".config/swappy".source = "${configdir}/swappy";
    ".config/tmux".source = "${configdir}/tmux";
    ".config/ranger/rifle.conf".source = "${configdir}/ranger/rifle.conf";
    ".config/ranger/commands.py".source = "${configdir}/ranger/commands.py";
    ".config/ranger/commands_full.py".source = "${configdir}/ranger/commands_full.py";
    ".config/ranger/scope.sh".source = "${configdir}/ranger/scope.py";
  };
}
