{ config, ... }:

let
  colors = config.colorScheme.colors;
in
{

  home.file = {
    ".config/rofi/config.rasi" = {
      text = ''

        	configuration {
        		modi: "drun,run,window,power:rofi-power-menu --choices=shutdown/reboot/logout";
        		display-drun: "Run shit...";
        		display-run: "All the things";
        		display-window: "Shit opened...";
        		show-icons: true;
        		terminal: "alacritty";
        		icon-theme: "Papirus-Dark";
        		matching: "fuzzy";
        		click-to-exit: true;
        		font: "JetBrains Mono NF 11";
        	}

        	@theme "nix-colors"
      '';
      executable = false;
    };
  };

  home.file = {
    ".config/rofi/themes/nix-colors.rasi" = {
      text = ''

        	* {
        		//scheme: "Tokyo Night Dark"
        		base00: #${colors.base00};
        		base01: #${colors.base01};
        		base02: #${colors.base02};
        		base03: #${colors.base03};
        		base04: #${colors.base04};
        		base05: #${colors.base05};
        		base06: #${colors.base06};
        		base07: #${colors.base07};
        		base08: #${colors.base08};
        		base09: #${colors.base09};
        		base0A: #${colors.base0A};
        		base0B: #${colors.base0B};
        		base0C: #${colors.base0C};
        		base0D: #${colors.base0D};
        		base0E: #${colors.base0E};
        		base0F: #${colors.base0F};

						bg:  @base00;
						text-light: @base05;
						text-dark: @base01;

        		borderRadius: 5px;

        		background-color: @bg;
        		border: 0px;

        		transparent: rgba(46,52,64,0);
        	}

        	window {
        		width: 800px;

        		orientation: horizontal;
        		location: center;
        		anchor: center;
        		transparency: "screenshot";
        		border-color: @base0D;
        		border: 2px;
        		border-radius: @borderRadius;
        		spacing: 0;
        		children: [ mainbox ];
        	}

        	mainbox {
        		spacing: 0;
        		children: [ inputbar, message, listview ];
        	}

        	inputbar {
        		padding: 10px;
        		border-radius: @borderRadius;
        	}

        	prompt {
        		color: @base0F;
        	}

        	entry {
        		color: @text-light;
        		cursor: text;
        		cursor-width: 3px;
        	}

        	prompt {
        		margin: 0px 5px 0px 0px;
        	}

        	listview {
        		layout: vertical;
        		padding: 0px 10px 10px 10px;
        		lines: 8;
        		columns: 1;
        		dynamic: false;
        	}

        	element {
        		padding: 2px 5px 2px 5px;
        		vertical-align: 1;
        		color: @text-light;
        		font: inherit;
        		border-radius: @borderRadius;

        		children: [ element-text, element-icon ];
        	}

        	element-icon {
        		background-color: inherit;
        		text-color: inherit;
        		size: 1.3em;
        	}

        	element-text {
        		background-color: inherit;
        		text-color: inherit;
        		vertical-align: 0.5;
        		highlight: bold underline italic;
        	}

        	element normal active {
        		background-color: @base0F;
        		color: @text-dark;
        	}

        	element normal urgent {
        		background-color: @base0F;
        	}

        	element selected.normal {
        		color: @text-dark;
        		background-color: @base07;
        	}

        	element selected.active {
        		color: @text-dark;
        		background-color: @base0C;
        	}

      '';
      executable = false;
    };
  };
}
