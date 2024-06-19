{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.master = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "cups"
    ];
  };
}
