{ pkgs, ... }:

{
  security.rtkit.enable = true;

  services = {

		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
			jack.enable = true;
			wireplumber.enable = true;
  	};

		pulseaudio = {
			enable = false;
		};
	};

  environment.systemPackages = with pkgs; [
    pamixer
    pavucontrol
  ];
}
