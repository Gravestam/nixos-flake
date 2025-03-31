{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager # home-manager
    nh # nh
    lsof # lsof
    gdb # gdbserver gcore gdb-add-index gdb
    bat # bat
    xsel # xsel
    unixtools.procps # pgrep kill ps pkill tload sysctl top free pidof watch pwait vmstat pmap slabtop w uptime pwdx
    psmisc # fuser pslog peekfd pstree.x11 prtstat pstree killall
    btop # btop
    lshw # lshw
    nmap # nping nmap ncat
    traceroute # traceroute
    fd # fd
    ripgrep # rg
    jq # jq
    git # git-cvsserver git-http-backend git-jump git-upload-archive git-receive-pack git-credential-netrc scalar git-shell git git-upload-pack
    lm_sensors # fancontrol sensors pwmconfig isadump sensors-detect sensors-conf-convert isaset
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
    tldr # tldr
    zip # zipcloak zipnote zip zipsplit
    unzip # unzipsfx unzip funzip zipgrep zipinfo
    openssl # c_rehash openssl
    pkg-config # pkg-config
    wget # wget
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    gnumake # make
    nixfmt-rfc-style # nixfmt
    gcc_multi # ld strings ranlib elfedit cpp c++ dwp nm cc g++ gcc addr2line readelf c++filt ld.gold strip objcopy ld.bfd size as ar objdump gprof
    mongosh # mongosh
    swaynotificationcenter # swaync-client swaync
    libnotify # notify-send
    udiskie # udiskie-info udiskie-mount udiskie-umount udiskie
    brightnessctl # brightnessctl
    grim # grim
    swappy # swappy
    slurp # slurp
    sshfs # mount.fuse.sshfs sshfs mount.sshfs
    swayimg # swayimg
    linuxHeaders
    pinentry-curses # pinentry pinentry-curses pinentry-tty
  ];
}
