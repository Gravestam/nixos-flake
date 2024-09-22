{ pkgs, ... }:

{
  home.packages = with pkgs; [
    haskellPackages.SVGFonts
    nodejs_20 # npx corepack node npm
    pm2 # pm2-dev pm2-runtime pm2 pm2-docker
    corepack # yarn yarnpkg pnpx pnpm
    nodePackages_latest.node-gyp # node-gyp
    signal-desktop # signal-desktop
    spotify
    slack # slack
    gimp
    qalculate-gtk
    inkscape-with-extensions
    obs-studio # obs-ffmpeg-mux obs
    imagemagick # stream magick-script mogrify magick compare conjure MagickWand-config display identify MagickCore-config Magick++-config animate import montage convert composite
    mpv # mpv_identify.sh mpv umpv
    ffmpeg # ffprobe ffplay ffmpeg
    wf-recorder # wf-recorder
    robo3t
    lyrebird
    hashcat # hashcat
    john # john the ripper
    wifite2 # wifite
		airgeddon
    p7zip # 7za 7zr 7z
    outils # md5
    hcxtools # hcxpsktool hcxwltool whoismac wlancap2wpasec hcxpmktool hcxpcapngtool hcxhash2cap hcxhashtool hcxeiutool
    aircrack-ng
    reaverwps-t6x
    bully
    qFlipper
    google-chrome
    esptool-ck
    minicom
    rpi-imager
    crunch
    wireshark-qt
    rofi-rbw-wayland
    wtype # wtype
    obsidian
    prismlauncher
    bitwarden
    protonup-qt # protonup
    rofi-wayland # rofi-sensible-terminal rofi rofi-theme-selector
    rofi-power-menu # dmenu-power-menu rofi-power-menu
    mongodb-compass
    brave # brave
    burpsuite
		speedtest-cli # speedtest
		wowup-cf # world of warcraft addons
		xclip
    luajit # luajit-2.1.1693350652 luajit lua
    go # gmfmt go
    rustup # rust-gdb rustdoc cargo-miri cargo-clippy rust-lldb rust-gdbgui clippy-driver rustup rust-analyzer rls rustfmt rustc cargo-fmt cargo
    python3 # idle3.11 python3.11-config python3.11 pydoc3.11 pydoc3 python3 python-config python 2to3-3.11 2to3 python3-config idle pydoc idle3
    libreoffice-fresh # simpress soffice unopkg smath swriter sbase libreoffice sdraw scalc
		# nodePackages_latest.eslint
		wpscan # wordpress pen testing
		nikto # webserver vuln testing
		zap # mitm (like burp)
		nuclei
		protonvpn-cli_2
  ];
}
