{ pkgs, ... }:

{
  home.packages = [
    pkgs.haskellPackages.SVGFonts
    pkgs.nodejs_20 # npx corepack node npm
    pkgs.pm2 # pm2-dev pm2-runtime pm2 pm2-docker
    pkgs.corepack # yarn yarnpkg pnpx pnpm
    pkgs.nodePackages_latest.node-gyp # node-gyp
    pkgs.signal-desktop # signal-desktop
    pkgs.spotify
    pkgs.slack # slack
    pkgs.gimp
    pkgs.qalculate-gtk
    pkgs.inkscape-with-extensions
    pkgs.obs-studio # obs-ffmpeg-mux obs
    pkgs.imagemagick # stream magick-script mogrify magick compare conjure MagickWand-config display identify MagickCore-config Magick++-config animate import montage convert composite
    pkgs.mpv # mpv_identify.sh mpv umpv
    pkgs.ffmpeg # ffprobe ffplay ffmpeg
    pkgs.wf-recorder # wf-recorder
    pkgs.robo3t
    pkgs.lyrebird
    pkgs.hashcat # hashcat
    pkgs.john # john the ripper
    pkgs.wifite2 # wifite
    pkgs.p7zip # 7za 7zr 7z
    pkgs.outils # md5
    pkgs.hcxtools # hcxpsktool hcxwltool whoismac wlancap2wpasec hcxpmktool hcxpcapngtool hcxhash2cap hcxhashtool hcxeiutool
    pkgs.aircrack-ng
    pkgs.reaverwps-t6x
    pkgs.bully
    pkgs.qFlipper
    pkgs.google-chrome
    pkgs.esptool-ck
    pkgs.minicom
    pkgs.rpi-imager
    pkgs.crunch
    pkgs.wireshark-qt
    pkgs.rofi-rbw-wayland
    pkgs.wtype # wtype
    pkgs.obsidian
    pkgs.prismlauncher
    pkgs.bitwarden
    pkgs.protonup-ng # protonup
    pkgs.rofi-wayland # rofi-sensible-terminal rofi rofi-theme-selector
    pkgs.rofi-power-menu # dmenu-power-menu rofi-power-menu
    pkgs.mongodb-compass
    pkgs.brave # brave
    pkgs.burpsuite
  ];
}
