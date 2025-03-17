{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    xdgOpenUsePortal = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  programs = {

    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamemode.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

		chromium = {
			enable = true;
		};
  };
}
