{ config, pkgs, ... }:

let
  scriptSrc = "${./../scripts/ollama-manager.sh}";
in
{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  environment.systemPackages = with pkgs; [
    bash
    fzf
    jq
    ollama

    # Include your script using stdenv.mkDerivation
    (pkgs.stdenv.mkDerivation {
      name = "om";
      src = scriptSrc;
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/om
        chmod +x $out/bin/om
      '';
    })
  ];
}
