{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true;
      cups-pdf.enable = true;
      drivers = [
        pkgs.hplip
        pkgs.gutenprint
      ];
    };
    system-config-printer.enable = true;
  };
  programs = {
    system-config-printer.enable = true;
  };
}
