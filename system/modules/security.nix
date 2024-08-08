{ ... }:

{
  security = {
    polkit.enable = true;

    pam = {
      services.swaylock = { };
      services.swaylock.fprintAuth = false;
    };

    sudo = {
      enable = true;
      extraRules = [
        {
          users = [ "master" ];
          commands = [
            {
              command = "/run/current-system/sw/bin/true";
              options = [ "NOPASSWD" ];
            }
          ];
        }
      ];
    };
  };
}
