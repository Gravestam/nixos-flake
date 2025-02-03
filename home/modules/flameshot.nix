{ config, ... }:

let
	colors = config.colorScheme.palette;
in
{
  services.flameshot = {
    enable = true;

		settings = {
			General = {
				disabledTrayIcon = true;
				showStartupLaunchMessage = false;
				showHelp = false;
				showSidePanelButton = true;
				showDesktopNotification = true;
				saveAfterCopy = false;
				uploadWithoutConfirmation = false;
				
				uiColor = "#${colors.base06}";
				contrastUiColor = "#${colors.base00}";
				drawColor = "#${colors.base0F}";
			};
		};
  };
}

