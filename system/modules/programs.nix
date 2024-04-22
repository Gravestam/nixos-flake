{ config, pkgs, ... }:

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
			#remotePlay.openFirewall = true;
			#dedicatedServer.openFirewall = true;
		};

		gnupg.agent = {
			enable = true;
			enableSSHSupport = true;
		};
		
		tmux = {
			enable = true;
			escapeTime = 0;
		};

		neovim = {
			enable = true;
			defaultEditor = true;
		};

		zsh = {
			enable = true;
			autosuggestions.enable = true;
			syntaxHighlighting.enable = true;
		};
	};
}
