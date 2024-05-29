{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.home-manager # home-manager
    pkgs.nh # nh
    pkgs.lsof # lsof
    pkgs.gdb # gdbserver gcore gdb-add-index gdb
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
    pkgs.xfce.thunar # thunar Thunar thunar-settings
    pkgs.libreoffice-fresh # simpress soffice unopkg smath swriter sbase libreoffice sdraw scalc
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-wlr
    pkgs.brave # brave
    pkgs.burpsuite
    pkgs.gnumake # make
    pkgs.luajit # luajit-2.1.1693350652 luajit lua
    pkgs.go # gmfmt go
    pkgs.rustup # rust-gdb rustdoc cargo-miri cargo-clippy rust-lldb rust-gdbgui clippy-driver rustup rust-analyzer rls rustfmt rustc cargo-fmt cargo
    pkgs.pkgs.nixfmt-rfc-style # nixfmt
    pkgs.python3 # idle3.11 python3.11-config python3.11 pydoc3.11 pydoc3 python3 python-config python 2to3-3.11 2to3 python3-config idle pydoc idle3
    pkgs.gcc_multi # ld strings ranlib elfedit cpp c++ dwp nm cc g++ gcc addr2line readelf c++filt ld.gold strip objcopy ld.bfd size as ar objdump gprof
    pkgs.mongodb-compass
    pkgs.mongosh # mongosh
    pkgs.rofi-wayland # rofi-sensible-terminal rofi rofi-theme-selector
    pkgs.rofi-power-menu # dmenu-power-menu rofi-power-menu
    pkgs.swaynotificationcenter # swaync-client swaync
    pkgs.libnotify # notify-send
    pkgs.udiskie # udiskie-info udiskie-mount udiskie-umount udiskie
    pkgs.brightnessctl # brightnessctl
    pkgs.grim # grim
    pkgs.swappy # swappy
    pkgs.slurp # slurp
    pkgs.sshfs # mount.fuse.sshfs sshfs mount.sshfs
    pkgs.swayimg # swayimg
    pkgs.protonup-ng # protonup
		pkgs.linuxHeaders
  ];
}
