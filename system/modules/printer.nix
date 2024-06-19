{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true;
      cups-pdf.enable = true;
    };
    system-config-printer.enable = true;
  };
  programs = {
    system-config-printer.enable = true;
  };
  environment.systemPackages = [
    pkgs.hplipWithPlugin
    pkgs.gutenprint
  ];
}
