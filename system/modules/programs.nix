{ config, pkgs, ... }:

{
	xdg.portal = {
		enable = true;
		extraPortals = [
			pkgs.xdg-desktop-portal-gtk
		];
		config.common.defaultPortal = "xdg-desktop-portal-gtk";
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
