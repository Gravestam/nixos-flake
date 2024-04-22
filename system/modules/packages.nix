{ config, pkgs, pkgs-unstable, ... }:

{
	environment.systemPackages = 
	
	(with pkgs; [
		bat
		btop
		nmap
		eza
		jq
		fzf
		git
		lm_sensors
		libsForQt5.qt5.qtquickcontrols2
		libsForQt5.qt5.qtgraphicaleffects
		libsForQt5.qt5.qtsvg
		fastfetch
		ripgrep
		tldr
		unzip
		openssl
		openssl.dev
		pkg-config
		wget
		xfce.thunar
		xdg-desktop-portal-gtk
		xdg-desktop-portal-wlr
		zip
		brave
		luajit
		go
		nodejs_21
		python3
		gcc_multi
		starship
		fd
		waybar
		rofi-wayland
		swww
		mako
		udiskie
		ranger
		burpsuite
		slack
		brightnessctl
		wezterm
		grim
		swappy
		slurp
		sshfs
		noto-fonts-monochrome-emoji
	])

	++

	(with pkgs-unstable; [
		alacritty
	]);
}
