{ pkgs, ... }:

{
  home.packages = [
    pkgs.haskellPackages.SVGFonts
    # pkgs.nodejs_18 # npx corepack node npm
    pkgs.nodejs_20 # npx corepack node npm
    pkgs.pm2 # pm2-dev pm2-runtime pm2 pm2-docker
    pkgs.corepack # yarn yarnpkg pnpx pnpm
    pkgs.nodePackages_latest.node-gyp # node-gyp
    pkgs.signal-desktop # signal-desktop
    pkgs.spotify
    pkgs.slack # slack
		pkgs.gimp
  ];
}
