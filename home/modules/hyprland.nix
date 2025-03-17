{
  config,
  pkgs,
  nix-colors,
  ...
}:

let
  colors = config.colorScheme.palette;

  terminal = "footclient --window-size-chars=110x30";
  browser = "brave";
  menu = "rofi -show drun";
	pwmanager = "rofi-rbw";
  webapps = "~/.config/hypr/scripts/rofi-webapps";
  websearch = "~/.config/hypr/scripts/rofi-websearch";
  lock = "~/.config/hypr/scripts/swaylock_lock";
  tabMenu = "rofi -show window";
  screenshot = "grim -g \"\$(slurp)\" - | swappy -f -";
  custom_move = "~/.config/hypr/scripts/moveWindow $resizeStep";

	# monitor_main = "HDMI-A-1";
	# monitor_secondary = "eDP-1";
	monitor_main = "eDP-1";
	monitor_secondary = "HDMI-A-1";

  waybar_start = pkgs.writeShellScriptBin "start" ''
    killall waybar
    pkill waybar
    sleep 0.5
    waybar &
  '';

  nixWallpaperFromSchemeCustom = import ./wallpaper.nix { inherit pkgs; };

  inherit (nix-colors.lib-contrib { inherit pkgs; }) nixWallpaperFromScheme;

  wallpaperPathTop = nixWallpaperFromSchemeCustom { scheme = config.colorScheme; };

  wallpaperPathBottom = nixWallpaperFromScheme {
    scheme = config.colorScheme;
    width = 3840;
    height = 1100;
    logoScale = 5.0;
  };
in
{
  wayland.windowManager.hyprland = {

    enable = true;
    systemd.variables = [ "--all" ];

    settings = {

      exec = [
        "${waybar_start}/bin/start"
        "swaync-client -rs"
        "systemctl --user restart hyprpaper.service"
      ];

      monitor = [
        "${monitor_main}, 3840x2160@120, 0x0, 2"
        "${monitor_secondary}, 3840x2160@60, 1920x0, 1"
        "DP-2, 3840x1100@60, 0x1080, 2"
        # "HDMI-A-1, 3840x2160@60, 1920x1080, 2"
        # "HDMI-A-1, 3840x2160@60, 1920x0, 1"
        # "HDMI-A-1, 1920x1080@60, -1920x0, 1"
      ];

      workspace = [
        "1,monitor:${monitor_main}"
        "2,monitor:${monitor_main}"
        "3,monitor:${monitor_main}"
        "4,monitor:${monitor_main}"
        "5,monitor:${monitor_main}"
        "6,monitor:${monitor_main}"
        "7,monitor:${monitor_main}"
        "8,monitor:${monitor_main}"
        "9,monitor:${monitor_main}"

        "10,monitor:DP-2"
        "11,monitor:DP-2"
        "12,monitor:DP-2"
        "13,monitor:DP-2"
        "14,monitor:DP-2"
        "15,monitor:DP-2"

        "16,monitor:${monitor_secondary}"
        "17,monitor:${monitor_secondary}"
        "18,monitor:${monitor_secondary}"
        "19,monitor:${monitor_secondary}"
        "20,monitor:${monitor_secondary}"
        "21,monitor:${monitor_secondary}"

        "special:scratch,gapsout:60,on-created-empty:${terminal}"
      ];

      "$resizeStep" = 20;

      # Scripts

      # Modifiers
      "$mainMod" = "SUPER";
      "$mod1" = "CTRL";
      "$mod2" = "SHIFT";
      "$mod3" = "ALT";

      "$cLeft" = "N";
      "$cRight" = "I";
      "$cUp" = "U";
      "$cDown" = "E";

      bind = [
        # Application bindings
        "$mainMod, Return, exec, ${terminal}"
        "$mainMod, B, exec, ${browser}"
        "$mainMod, Y, exec, ${pwmanager}"
        # "$mainMod $mod1, Return, exec, ${terminal} --class=Terminal-Float"
        "$mainMod $mod1, Return, exec, ${terminal} --app-id=Terminal-Float"
        "$mainMod, Space, exec, ${menu}"
        "$mainMod $mod1, Space, exec, ${webapps}"
        "$mainMod $mod1, J, exec, ${websearch}"
        "$mainMod $mod1, L, exec, ${lock}"
        "$mainMod, Z, exec, ${screenshot}"
        "$mainMod, Tab, exec, ${tabMenu}"

        "$mainMod, Q, killactive"

        # Layout bindings
        "$mainMod, G, togglefloating"
        "$mainMod, F, fullscreen"
        "$mainMod, P, togglesplit"

        # Move focus
        "$mainMod, $cLeft, movefocus, l"
        "$mainMod, $cRight, movefocus, r"
        "$mainMod, $cUp, movefocus, u"
        "$mainMod, $cDown, movefocus, d"

        # Focus monitor
        "$mainMod, O, focusmonitor, +1"

        # Move to next/previous workspace on current monitor
        "$mainMod, T, workspace, r+1"
        "$mainMod, S, workspace, r-1"

        # Special workspace
        "$mainMod, J, togglespecialworkspace, scratch"

        # Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace
        "$mainMod $mod1, 1, movetoworkspace, 1"
        "$mainMod $mod1, 2, movetoworkspace, 2"
        "$mainMod $mod1, 3, movetoworkspace, 3"
        "$mainMod $mod1, 4, movetoworkspace, 4"
        "$mainMod $mod1, 5, movetoworkspace, 5"
        "$mainMod $mod1, 6, movetoworkspace, 6"
        "$mainMod $mod1, 7, movetoworkspace, 7"
        "$mainMod $mod1, 8, movetoworkspace, 8"
        "$mainMod $mod1, 9, movetoworkspace, 9"
        "$mainMod $mod1, 0, movetoworkspace, 10"

        # Move active window to relative workspace
        "$mainMod $mod1, S, movetoworkspace, r-1"
        "$mainMod $mod1, T, movetoworkspace, r+1"
      ];

      binde = [
        # Move windows
        "$mainMod $mod1, $cLeft, exec, ${custom_move} l"
        "$mainMod $mod1, $cRight, exec, ${custom_move} r"
        "$mainMod $mod1, $cUp, exec, ${custom_move} u"
        "$mainMod $mod1, $cDown, exec, ${custom_move} d"

        # Resize windows
        "$mainMod $mod2, $cLeft, resizeactive, -$resizeStep 0"
        "$mainMod $mod2, $cRight, resizeactive, $resizeStep 0"
        "$mainMod $mod2, $cUp, resizeactive, 0 -$resizeStep"
        "$mainMod $mod2, $cDown, resizeactive, 0 $resizeStep"
      ];

      bindm = [
        # Move/resize windows with mouse
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrulev2 = [ "float, class:^(Terminal-Float)$" ];

      input = {
        kb_layout = "us, se";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 0;

        touchpad = {
          natural_scroll = "no";
        };

        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;

        "col.active_border" = "rgb(${colors.base0D}) rgb(${colors.base03}) rgb(${colors.base0D}) 180deg";
        "col.inactive_border" = "rgb(${colors.base03})";

        # layout = "master";
        layout = "dwindle";

        allow_tearing = false;
      };

      cursor = {
        # inactive_timeout = 1;
        hide_on_key_press = true;
      };

      decoration = {

        rounding = 3;

        blur = {
          enabled = true;
          size = 5;
          passes = 4;
          new_optimizations = true;
          xray = true;
        };
      };

      animations = {
        enabled = "yes";

        bezier = "myBezier, 0.10, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 2, myBezier"
          "windowsOut, 1, 2, default, popin 80%"
          "border, 1, 2, default"
          "borderangle, 1, 2, default"
          "fade, 1, 2, default"
          "workspaces, 1, 2, default"
        ];
      };

      dwindle = {
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes"; # you probably want this
      };

      gestures = {
        workspace_swipe = "off";
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_focuses_monitor = false;
      };
    };
  };

  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;

      preload = [
        "${wallpaperPathTop}"
        "${wallpaperPathBottom}"
      ];

      wallpaper = [
        "eDP-1,${wallpaperPathTop}"
        "DP-2,${wallpaperPathBottom}"
        "HDMI-A-1,${wallpaperPathTop}"
      ];
    };
  };
}
