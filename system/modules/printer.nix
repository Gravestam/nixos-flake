{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true;
      cups-pdf.enable = true;
    };
		colord.enable = true;
    system-config-printer.enable = true;
  };
  programs = {
    system-config-printer.enable = true;
  };
  environment.systemPackages = with pkgs; [
    # hplipWithPlugin
    gutenprint
		colord
  ];
}
