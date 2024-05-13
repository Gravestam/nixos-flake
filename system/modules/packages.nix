{ config, pkgs, ... }:

{
	environment.systemPackages = [ 
		pkgs.home-manager # home-manager
		pkgs.nh # nh
		pkgs.bat # bat 
		pkgs.xsel # xsel 
		pkgs.unixtools.procps # pgrep kill ps pkill tload sysctl top free pidof watch pwait vmstat pmap slabtop w uptime pwdx 
		pkgs.psmisc # fuser pslog peekfd pstree.x11 prtstat pstree killall 
		pkgs.btop # btop 
		pkgs.lshw # lshw 
		pkgs.nmap # nping nmap ncat 
		pkgs.traceroute # traceroute 
		pkgs.fd # fd 
		pkgs.ripgrep # rg 
		pkgs.jq # jq 
		pkgs.git # git-cvsserver git-http-backend git-jump git-upload-archive git-receive-pack git-credential-netrc scalar git-shell git git-upload-pack 
		pkgs.lm_sensors # fancontrol sensors pwmconfig isadump sensors-detect sensors-conf-convert isaset 
		pkgs.libsForQt5.qt5.qtquickcontrols2
		pkgs.libsForQt5.qt5.qtgraphicaleffects
		pkgs.libsForQt5.qt5.qtsvg
		pkgs.tldr # tldr 
		pkgs.zip # zipcloak zipnote zip zipsplit 
		pkgs.unzip # unzipsfx unzip funzip zipgrep zipinfo 
		pkgs.openssl # c_rehash openssl 
		pkgs.pkg-config # pkg-config 
		pkgs.wget # wget 
		pkgs.gimp-with-plugins # gimp-2.10 gimptool-2.0 gimp-console-2.10 gimp-test-clipboard-2.0 gimp gimp-console 
		pkgs.xfce.thunar # thunar Thunar thunar-settings 
		pkgs.libreoffice-fresh # simpress soffice unopkg smath swriter sbase libreoffice sdraw scalc 
		pkgs.xdg-desktop-portal-gtk
		pkgs.xdg-desktop-portal-wlr
		pkgs.brave # brave 
		pkgs.burpsuite
		pkgs.gnumake # make 
		pkgs.luajit # luajit-2.1.1693350652 luajit lua 
		pkgs.go # gmfmt go 
		pkgs.nodejs_20 # npx corepack node npm 
		pkgs.pm2 # pm2-dev pm2-runtime pm2 pm2-docker 
		pkgs.yarn # yarn yarnpkg 
		pkgs.python3 # idle3.11 python3.11-config python3.11 pydoc3.11 pydoc3 python3 python-config python 2to3-3.11 2to3 python3-config idle pydoc idle3 
		pkgs.gcc_multi # ld strings ranlib elfedit cpp c++ dwp nm cc g++ gcc addr2line readelf c++filt ld.gold strip objcopy ld.bfd size as ar objdump gprof 
		pkgs.mongodb-compass
		pkgs.mongosh # mongosh 
		pkgs.rofi-wayland # rofi-sensible-terminal rofi rofi-theme-selector 
		pkgs.rofi-power-menu # dmenu-power-menu rofi-power-menu 
		pkgs.swaynotificationcenter # swaync-client swaync 
		pkgs.libnotify # notify-send 
		pkgs.udiskie # udiskie-info udiskie-mount udiskie-umount udiskie 
		pkgs.slack # slack 
		pkgs.brightnessctl # brightnessctl 
		pkgs.grim # grim 
		pkgs.swappy # swappy 
		pkgs.slurp # slurp 
		pkgs.sshfs # mount.fuse.sshfs sshfs mount.sshfs 
		pkgs.signal-desktop # signal-desktop 
		pkgs.spotify
		pkgs.wf-recorder # wf-recorder 
		pkgs.mpv # mpv_identify.sh mpv umpv 
		pkgs.ffmpeg # ffprobe ffplay ffmpeg 
		pkgs.swayimg # swayimg 
		pkgs.imagemagick # stream magick-script mogrify magick compare conjure MagickWand-config display identify MagickCore-config Magick++-config animate import montage convert composite 
		pkgs.obs-studio # obs-ffmpeg-mux obs 
		pkgs.protonup-ng # protonup 
	];
}
