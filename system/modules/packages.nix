{ config, pkgs, pkgs-unstable, ... }:

{
	environment.systemPackages = [ 
		pkgs.bat
		pkgs.btop
		pkgs.nmap
		pkgs.eza
		pkgs.jq
		pkgs.fzf
		pkgs.git
		pkgs.lm_sensors
		pkgs.libsForQt5.qt5.qtquickcontrols2
		pkgs.libsForQt5.qt5.qtgraphicaleffects
		pkgs.libsForQt5.qt5.qtsvg
		pkgs.fastfetch
		pkgs.ripgrep
		pkgs.tldr
		pkgs.unzip
		pkgs.openssl
		pkgs.openssl.dev
		pkgs.pkg-config
		pkgs.wget
		pkgs.xfce.thunar
		pkgs.xdg-desktop-portal-gtk
		pkgs.xdg-desktop-portal-wlr
		pkgs.zip
		pkgs.brave
		pkgs.luajit
		pkgs.go
		pkgs.nodejs_20
		pkgs.python3
		pkgs.gcc_multi
		pkgs.starship
		pkgs.fd
		pkgs.waybar
		pkgs.rofi-wayland
		pkgs.mako
		pkgs.udiskie
		pkgs.ranger
		pkgs.burpsuite
		pkgs.slack
		pkgs.brightnessctl
		pkgs.wezterm
		pkgs-unstable.alacritty
		pkgs.grim
		pkgs.swappy
		pkgs.slurp
		pkgs.sshfs
		pkgs.rofi-power-menu
		pkgs.signal-desktop
	];
}
