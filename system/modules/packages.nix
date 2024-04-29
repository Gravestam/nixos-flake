{ config, pkgs, ... }:

{
	environment.systemPackages = [ 
		pkgs.bat
		pkgs.xsel
		pkgs.unixtools.procps
		pkgs.psmisc # pstree killall pstree.x11 pslog prtstat peekfd fuser
		pkgs.btop
		pkgs.nmap
		pkgs.eza
		pkgs.gnumake
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
		pkgs.yarn
		pkgs.pm2
		pkgs.python3
		pkgs.gcc_multi
		pkgs.starship
		pkgs.fd
		pkgs.waybar
		pkgs.mongodb-compass
		pkgs.rofi-wayland
		pkgs.swaynotificationcenter
		pkgs.libnotify
		pkgs.udiskie
		pkgs.ranger
		pkgs.burpsuite
		pkgs.slack
		pkgs.brightnessctl
		pkgs.wezterm
		pkgs.alacritty
		pkgs.grim
		pkgs.swappy
		pkgs.slurp
		pkgs.sshfs
		pkgs.rofi-power-menu
		pkgs.signal-desktop
		pkgs.bitwarden
		pkgs.spotify
		pkgs.wf-recorder
		pkgs.mpv
		pkgs.ffmpeg
		pkgs.swayimg
		pkgs.steam
	];
}
