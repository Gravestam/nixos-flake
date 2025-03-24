{ config, ... }:

let
  colors = config.colorScheme.palette;
	# monitor_mainbar = "HDMI-A-1";
	# monitor_secondary = "eDP-1";
	monitor_mainbar = "eDP-1";
	monitor_secondary = "HDMI-A-1";
	monitor_bottom = "DP-2";
in
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 0;
        output = [ "${monitor_mainbar}" ];

        modules-left = [
          "custom/distro"
          "battery"
          "group/performance"
          "hyprland/window"
        ];

        modules-center = [ "hyprland/workspaces" ];

        modules-right = [
          "tray"
          "bluetooth"
          "group/sound"
          "hyprland/language"
          "network"
          "custom/notification"
          "clock"
        ];

        # Workspaces
        "hyprland/workspaces" = {
          on-click = "activate";
          active-only = true;
          all-outputs = false;
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
          persistent-workspaces = {
            "${monitor_mainbar}" = [
              1
              2
              3
              4
              5
              6
              7
              8
              9
            ];
          };
        };

        # Taskbar
        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 18;
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
          ignore-list = [ ];
          rewrite = {
            "Firefox Web Browser" = "Firefox";
            "Foot Server" = "Terminal";
          };
        };

        # Hyprland Window
        "hyprland/window" = {
          max-length = 25;
          rewrite = {
            "" = "Do shit...";
          };
          separate-outputs = false;
        };

        # System tray
        "tray" = {
          icon-size = 15;
          spacing = 12;
        };

        # Clock
        "clock" = {
          format = "󰥔 {:%H:%M | %d-%m-%Y}";
          tooltip = true;
          tooltip-format = "{:%A, %d %B %Y }";
        };
        # CPU
        "cpu" = {
          interval = 5;
          format = "{usage:2}%";
          tooltip = true;
        };

        # Memory
        "memory" = {
          interval = 5;
          format = "  {}%";
          tooltip = true;
        };

        # Harddisc space used
        "disk" = {
          interval = 30;
          format = "󰋊 {percentage_used}%";
          tooltip = true;
          path = "/";
        };

        "hyprland/language" = {
          format = " {}";
          format-en = "ANSI";
          format-sv = "ISO";
        };

        # Network
        "network" = {
          format = "󰩠 {ipaddr}";
          format-wifi = "󰘊 {signalStrength}%";
          format-ethernet = "<big>󰩠</big> {ipaddr}";
          format-disconnected = "<big>󰅛</big> DC";
          tooltip-format = "{ifname} via {gwaddri}";
          tooltip-format-wifi = "{ifname} @ {essid}\n<big>󰩠</big> {ipaddr}\n<big>󰣾</big> {signalStrength}%\n<big>󰀂</big> {frequency}MHz\n<big>󰛶</big> {bandwidthUpBits}\n<big>󰛴</big> {bandwidthDownBits}";
          tooltip-format-ethernet = "{ifname}\n<big>󰩠</big> {ipaddr}\n<big>󰛶</big> {bandwidthUpBits}\n<big>󰛴</big> {bandwidthDownBits}";
          tooltip-format-disconnected = "󰌙 Disconnected";
          max-length = 50;
          on-click = "nm-connection-editor";
        };

        # Battery
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        # Pulseaudio
        "pulseaudio" = {
          scroll-step = 1;
          format = "{icon}  {volume}%";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              " "
              " "
            ];
          };
          on-click = "sleep 0.1 && pavucontrol";
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = " Muted";
          on-click-right = "sleep 0.1 && pavucontrol";
          scroll-step = 1;
        };

        # Bluetooth
        "bluetooth" = {
          format = "󰂰";
          format-disabled = "󰂲";
          format-off = "󰂲";
          format-no-controller = "󰂲";
          interval = 30;
          tooltip = true;
        };

        "custom/distro" = {
          format = " NixOS";
          tooltip = false;
        };

        "custom/notification" = {
          tooltip = false;
          format = "{} {icon}";
          format-icons = {
            notification = "";
            none = "";
            dnd-notification = "";
            dnd-none = "";
            inhibited-notification = "";
            inhibited-none = "";
            dnd-inhibited-notification = "";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        "group/sound" = {
          orientation = "horizontal";
          modules = [
            "pulseaudio"
            "pulseaudio#microphone"
          ];
        };

        "group/performance" = {
          orientation = "horizontal";
          modules = [
            "disk"
            "cpu"
            "memory"
          ];
        };
      };

      offBar = {
        name = "left";
        layer = "top";
        position = "left";
        height = 0;
        width = 0;
        output = [ "${monitor_bottom}" ];

        modules-left = [ ];

        modules-center = [ "hyprland/workspaces" ];

        modules-right = [ ];

        # Workspaces
        "hyprland/workspaces" = {
          on-click = "activate";
          active-only = true;
          all-outputs = false;
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
          persistent-workspaces = {
            "${monitor_bottom}" = [
              10
              11
              12
              13
              14
              15
            ];
          };
        };
      };

      external = {
        name = "external";
        layer = "top";
        position = "right";
        height = 0;
        width = 0;
        output = [ "${monitor_secondary}" ];

        modules-left = [ ];

        modules-center = [ "hyprland/workspaces" ];

        modules-right = [ ];

        # Workspaces
        "hyprland/workspaces" = {
          on-click = "activate";
          active-only = true;
          all-outputs = false;
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
          persistent-workspaces = {
            "${monitor_secondary}" = [
              16
              17
              18
              19
              20
              21
            ];
          };
        };
      };
    };

    style = ''
      	/* base00 - Default Background */
      	/* base01 - Lighter Background (Used for status bars, line number and folding marks) */
      	/* base02 - Selection Background */
      	/* base03 - Comments, Invisibles, Line Highlighting */
      	/* base04 - Dark Foreground (Used for status bars) */
      	/* base05 - Default Foreground, Caret, Delimiters, Operators */
      	/* base06 - Light Foreground (Not often used) */
      	/* base07 - Light Background (Not often used) */
      	/* base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted */
      	/* base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url */
      	/* base0A - Classes, Markup Bold, Search Text Background */
      	/* base0B - Strings, Inherited Class, Markup Code, Diff Inserted */
      	/* base0C - Support, Regular Expressions, Escape Characters, Markup Quotes */
      	/* base0D - Functions, Methods, Attribute IDs, Headings */
      	/* base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed */
      	/* base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?> */

      	@define-color base00 #${colors.base00};
      	@define-color base01 #${colors.base01};
      	@define-color base02 #${colors.base02};
      	@define-color base03 #${colors.base03};
      	@define-color base04 #${colors.base04};
      	@define-color base05 #${colors.base05};
      	@define-color base06 #${colors.base06};
      	@define-color base07 #${colors.base07};
      	@define-color base08 #${colors.base08};
      	@define-color base09 #${colors.base09};
      	@define-color base0A #${colors.base0A};
      	@define-color base0B #${colors.base0B};
      	@define-color base0C #${colors.base0C};
      	@define-color base0D #${colors.base0D};
      	@define-color base0E #${colors.base0E};
      	@define-color base0F #${colors.base0F};

      	* {
      		all: unset;

      		font-size: 15px;
      		font-family:
      			JetBrainsMono Nerd Font,
      			Font Awesome,
      			sans-serif;
      		font-weight: 700;
      	}

      	window#waybar {
      		background: @base00;

      		border-radius: 0px;
      	}

      	#workspaces {
      		margin: 5px 2px;
      		padding: 0px 5px;
      		border: none;
      	}

      	window.left #workspaces, window.external #workspaces {
      		padding: 5px 0px;
      	}

      	#workspaces button {
      		color: @base01;
      		background: @base04;

      		margin: 4px 3px;
      		padding: 0px 5px;
      		border-radius: 5px;
      		border: none;

      		opacity: 0.45;
      		min-width: 25px;

      		transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
      	}

      	window.left #workspaces button, window.external #workspaces button {
      		min-height: 30px;
      		min-width: unset;
      	}

      	#workspaces button.urgent {
      		background: @base0F;
      	}

      	#workspaces button:not(.empty) {
      		background: @base0D;
      	}

      	#workspaces button.active {
      		opacity: 1;
      		min-width: 50px;
      	}

      	window.left #workspaces button.active, window.external #workspaces button.active {
      		min-height: 45px;
      	}

      	#workspaces button:hover {
      		opacity: 1;
      	}

      	#cpu, #disk, #memory, #pulseaudio, #pulseaudio.microphone, #battery, #network, #tray, #language, #bluetooth {
      		color: @base0D;
      	}

      	#clock, #window {
      		color: @base0F;
      	}

      	#window, #clock, #performance, #sound, #battery, #network, #tray, #language, #bluetooth, #custom-notification, #custom-distro {
      		background: @base01;

      		margin: 5px 2px;
      		padding: 2px 10px;
      		border-radius: 5px;
      	}

      	#tray menu {
      		color: @base09;
      		background: @base01;

      		border: 1px solid @base03;

      		padding: 10px;
      		border-radius: 5px;
      	}

      	#tray menu menuitem {
      		padding: 0px 5px 0px 5px;
      	}
      	#tray menu menuitem:hover {
      		color: @base01;
      		background: @base09;
      	}

      	#custom-distro {
      		color: @base08;
      		background: unset;

      		padding-right: 16px;
      	}

      	#custom-notification {
      		color: @base0D;

      		padding-right: 15px;
      	}

      	#sound #pulseaudio.microphone, #performance #cpu, #performance #memory {
      		margin-left: 15px;
      	}

      	tooltip {
      		background: @base01;

      		border: 1px solid @base03;
      		border-radius: 5px;
      	}

      	tooltip label {
      		color: @base09;
      		padding: 5px;
      	}
    '';
  };
}
